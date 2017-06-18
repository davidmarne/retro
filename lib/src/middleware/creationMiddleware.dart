library creationMiddleware;

import 'package:built_redux/built_redux.dart';
import 'package:built_collection/built_collection.dart';

import '../refs.dart';
import '../state/app.dart';
import '../state/boards.dart';
import '../models/session.dart';
import '../models/category.dart';
import '../models/item.dart';
import '../models/note.dart';
import '../models/board.dart';
import '../models/user.dart';
import '../serializers.dart';

import 'refMiddleware.dart';

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
  CreateBoardPayload(this.title, this.description);
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
      var boardUid = api.state.boards.currentUid;
      var sessionUid = api.state.sessions.currentUid;
      var ownerUid = api.state.users.currentUid;
      var newPostRef = await refs.sessions(boardUid).push().future;
      var key = newPostRef.key;
      var note = new Note((NoteBuilder b) => b
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
      var boardUid = api.state.boards.currentUid;
      var sessionUid = api.state.sessions.currentUid;
      var ownerUid = api.state.users.currentUid;
      var newPostRef = await refs.sessions(boardUid).push().future;
      var key = newPostRef.key;
      var item = new Item((ItemBuilder b) => b
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
      var boardUid = api.state.boards.currentUid;
      var newPostRef = await refs.categories(boardUid).push().future;
      var key = newPostRef.key;
      var category = new Category((CategoryBuilder b) => b
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
      var boardUid = api.state.boards.currentUid;
      var newPostRef = await refs.sessions(boardUid).push().future;
      var key = newPostRef.key;
      var session = new Session((SessionBuilder b) => b
        ..uid = key
        ..boardUid = boardUid
        ..targetTime = action.payload.targetTime
        ..startDate = 0
        ..endDate = 0);

      api.actions.sessions.update(session);
      await newPostRef.set(serializers.serializeWith(Session.serializer, session));
    };

_createBoard(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateBoardPayload> action,
    ) async {
      var ownerUid = api.state.users.currentUid;
      var newPostRef = await refs.boards().push().future;
      var key = newPostRef.key;
      var board = new Board((BoardBuilder b) => b
        ..uid = key
        ..ownerUid = ownerUid
        ..title = action.payload.title
        ..description = action.payload.description);

      api.actions.boards.update(board);
      await newPostRef.set(serializers.serializeWith(Board.serializer, board));
    };

_createUser(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateUserPayload> action,
    ) async {
      var newPostRef = await refs.users().push().future;
      var user = new User((UserBuilder b) => b
        ..uid = action.payload.uid
        ..name = action.payload.name);

      api.actions.users.update(user);
      await newPostRef.set(serializers.serializeWith(User.serializer, user));
      api.actions.ref.subToUser(new SubPayload(user.uid));
    };

////////////////////
/// Util
///////////////////

BuiltMap<String, bool> _keyListToBuiltMap(Iterable<String> keys) {
  var map = new Map<String, bool>();
  for (String key in keys) map[key] = true;
  return new BuiltMap<String, bool>(map);
}
