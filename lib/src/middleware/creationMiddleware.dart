library creationMiddleware;

import 'package:built_redux/built_redux.dart';

import '../refs.dart';
import '../state/app.dart';
import '../models/session.dart';
import '../models/category.dart';
import '../models/dateIntervalKinds.dart';
import '../models/item.dart';
import '../models/note.dart';
import '../models/board.dart';
import '../models/user.dart';
import '../serializers.dart';

part 'creationMiddleware.g.dart';

////////////////////
/// Actions
///////////////////

// Actions to be handled by this middleware
abstract class CreationMiddlewareActions extends ReduxActions {
  ActionDispatcher<CreateUserPayload> user;
  ActionDispatcher<CreateBoardPayload> board;
  ActionDispatcher<CreateSessionPayload> session;
  ActionDispatcher<CreateCategoryPayload> category;
  ActionDispatcher<CreateItemPayload> item;
  ActionDispatcher<CreateNotePayload> note;

  CreationMiddlewareActions._();
  factory CreationMiddlewareActions() => new _$CreationMiddlewareActions();
}

////////////////////
/// Payloads
///////////////////

class CreateUserPayload {
  final String uid;
  final String name;
  CreateUserPayload(this.uid, this.name);
}

class CreateBoardPayload {
  final String title;
  final String description;
  final int interval;
  final DateIntervalKinds intervalKind;
  CreateBoardPayload(this.title, this.description, this.interval, this.intervalKind);
}

class CreateSessionPayload {
  final int targetTime;
  final Iterable<Category> categories;
  CreateSessionPayload(this.targetTime, this.categories);
}

class CreateCategoryPayload {
  final String title;
  final String description;
  final int order;
  CreateCategoryPayload(this.title, this.description, this.order);
}

class CreateItemPayload {
  final String text;
  final String categoryUid;
  CreateItemPayload(this.text, this.categoryUid);
}

class CreateNotePayload {
  final String text;
  CreateNotePayload(this.text);
}

////////////////////
/// Action Map
///////////////////

createCreationMiddleware(Refs refs) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<CreateUserPayload>(CreationMiddlewareActionsNames.user, _createUser(refs))
      ..add<CreateBoardPayload>(CreationMiddlewareActionsNames.board, _createBoard(refs))
      ..add<CreateSessionPayload>(CreationMiddlewareActionsNames.session, _createSession(refs))
      ..add<CreateCategoryPayload>(CreationMiddlewareActionsNames.category, _createCategory(refs))
      ..add<CreateItemPayload>(CreationMiddlewareActionsNames.item, _createItem(refs))
      ..add<CreateNotePayload>(CreationMiddlewareActionsNames.note, _createNote(refs)))
    .build();

////////////////////
/// Handlers
///////////////////
///
_createNote(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateNotePayload> action,
    ) async {
      final boardUid = api.state.boards.currentUid;
      final sessionUid = api.state.sessions.currentUid;
      final ownerUid = api.state.users.currentUid;
      final newPostRef = await refs.sessions(boardUid).push().future;
      final key = newPostRef.key;
      final note = new Note((NoteBuilder b) => b
        ..uid = key
        ..boardUid = boardUid
        ..sessionUid = sessionUid
        ..ownerUid = ownerUid
        ..text = action.payload.text
        ..visible = true
        ..ownerUid = api.state.auth.currentUser.uid);

      api.actions.notes.update(note);
      await newPostRef.set(serializers.serializeWith(Note.serializer, note));
    };

_createItem(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateItemPayload> action,
    ) async {
      final boardUid = api.state.boards.currentUid;
      final sessionUid = api.state.sessions.currentUid;
      final ownerUid = api.state.users.currentUid;
      final newPostRef = await refs.sessions(boardUid).push().future;
      final key = newPostRef.key;
      final item = new Item((ItemBuilder b) => b
        ..uid = key
        ..boardUid = boardUid
        ..sessionUid = sessionUid
        ..ownerUid = ownerUid
        ..categoryUid = action.payload.categoryUid
        ..time = 0
        ..text = action.payload.text
        ..visible = true
        ..ownerUid = api.state.auth.currentUser.uid);

      api.actions.items.update(item);
      await newPostRef.set(serializers.serializeWith(Item.serializer, item));
    };

_createCategory(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateCategoryPayload> action,
    ) async {
      final boardUid = api.state.boards.currentUid;
      final newPostRef = await refs.categories(boardUid).push().future;
      final key = newPostRef.key;
      final category = new Category((CategoryBuilder b) => b
        ..uid = key
        ..boardUid = boardUid
        ..title = action.payload.title
        ..description = action.payload.description);

      api.actions.categories.update(category);
      await newPostRef.set(serializers.serializeWith(Category.serializer, category));
    };

_createSession(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateSessionPayload> action,
    ) async {
      final boardUid = api.state.boards.currentUid;
      final newPostRef = await refs.sessions(boardUid).push().future;
      final key = newPostRef.key;
      final session = new Session((SessionBuilder b) => b
        ..uid = key
        ..boardUid = boardUid
        ..targetTime = action.payload.targetTime
        ..startTime = 0
        ..endTime = 0
        ..topicStartTime = 0
        ..topicEndTime = 0);

      api.actions.sessions.update(session);
      await newPostRef.set(serializers.serializeWith(Session.serializer, session));
    };

_createBoard(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateBoardPayload> action,
    ) async {
      final ownerUid = api.state.users.currentUid;
      final newPostRef = await refs.boards().push().future;
      final key = newPostRef.key;
      final board = new Board((BoardBuilder b) => b
        ..uid = key
        ..ownerUid = ownerUid
        ..title = action.payload.title
        ..description = action.payload.description
        ..interval = action.payload.interval
        ..intervalKind = action.payload.intervalKind.index);

      // persist the board
      await newPostRef.set(serializers.serializeWith(Board.serializer, board));

      // create the first session if it is a repeated board
      if (action.payload.interval != 0) {
        final now = new DateTime.now();
        final topicStart = new DateTime(now.year, now.month, now.day);
        final topicEnd =
            addIntervalToTime(topicStart, action.payload.interval, action.payload.intervalKind);
        final newSessRef = await refs.sessions(key).push().future;
        final initialSession = new Session((SessionBuilder b) => b
          ..uid = newSessRef.key
          ..boardUid = key
          ..title = '${dateFormat.format(topicStart)} - ${dateFormat.format(topicEnd)}'
          ..targetTime = 3600000
          ..startTime = 0
          ..endTime = 0
          ..topicStartTime = topicStart.millisecondsSinceEpoch
          ..topicEndTime = topicEnd.millisecondsSinceEpoch);
        await newSessRef.set(serializers.serializeWith(Session.serializer, initialSession));
      }

      await refs
          .userBoards(api.state.users.currentUid)
          .child(key)
          .set(new DateTime.now().millisecondsSinceEpoch);
    };

_createUser(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateUserPayload> action,
    ) async {
      final newPostRef = await refs.user(action.payload.uid);
      final user = new User((UserBuilder b) => b
        ..uid = action.payload.uid
        ..name = action.payload.name);

      api.actions.users.setCurrent(action.payload.uid);
      api.actions.users.update(user);
      await newPostRef.set(serializers.serializeWith(User.serializer, user));
    };
