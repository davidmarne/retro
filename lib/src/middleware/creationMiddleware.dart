library creationMiddleware;

import 'package:built_redux/built_redux.dart';
import 'package:built_collection/built_collection.dart';

import '../refs.dart';
import '../state/app.dart';
import '../state/boards.dart';
import '../models/category.dart';
import '../models/item.dart';
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
  final String displayName;
  CreateUserPayload(this.uid, this.displayName);
}

class CreateBoardPayload {
  final String title;
  final String description;
  CreateBoardPayload(this.title, this.description);
}

class CreateSessionPayload {
  final int targetTime;
  final String copySessionUid;
  CreateSessionPayload(this.targetTime, this.copySessionUid);
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

_createItem(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateItemPayload> action,
    ) async {
      var payload = action.payload;
      var newPostRef = await refs.items(payload.groupUid, payload.boardUid).push().future;
      var key = newPostRef.key;

      var item = new Item((ItemBuilder b) => b
        ..uid = key
        ..text = payload.text
        ..categoryUid = payload.categoryUid
        ..ownerUid = api.state.auth.currentUser.uid);

      api.actions.boards.addItem(
        new AddItemPayload(payload.groupUid, payload.boardUid, item),
      );
      await newPostRef.set(serializers.serializeWith(Item.serializer, item));
    };

_createCategory(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateCategoryPayload> action,
    ) async {
      var payload = action.payload;
      var newPostRef = await refs.categories(payload.groupUid, payload.boardUid).push().future;
      var key = newPostRef.key;

      var category = new Category((CategoryBuilder b) => b
        ..order = 0
        ..uid = key
        ..title = payload.title
        ..color = payload.color);

      api.actions.boards.addCategory(
        new AddCategoryPayload(payload.groupUid, payload.boardUid, category),
      );
      await newPostRef.set(serializers.serializeWith(Category.serializer, category));
    };

_createGroup(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateGroupPayload> action,
    ) async {
      var newPostRef = await refs.groups().push().future;
      var key = newPostRef.key;

      var allUsers = action.payload.users.toList()..add(api.state.auth.currentUser.uid);
      var userMapBuilder = _keyListToBuiltMap(allUsers).toBuilder();

      var group = new Group((GroupBuilder b) => b
        ..uid = key
        ..displayName = action.payload.displayName
        ..description = action.payload.description
        ..users = userMapBuilder);

      api.actions.groups.updateGroup(group);
      api.actions.groups.setCurrentGroup(group.uid);
      await newPostRef.set(serializers.serializeWith(Group.serializer, group));

      var newUser =
          api.state.users.currentUser.rebuild((UserBuilder b) => b..groups[group.uid] = true);
      api.actions.users.updateUser(newUser);
      await refs.userGroups(newUser.uid).child(group.uid).set(true);

      api.actions.ref.subToGroup(key);
    };

_createBoard(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateBoardPayload> action,
    ) async {
      var payload = action.payload;
      var newPostRef = await refs.boardGroup(payload.groupUid).push().future;
      var key = newPostRef.key;
      var board = new Board((BoardBuilder b) => b
        ..uid = key
        ..displayName = payload.displayName
        ..description = payload.description
        ..endDate = payload.endDate
        ..startDate = payload.startDate
        ..groupUid = api.state.groups.currentGroupUid);

      api.actions.boards.updateBoard(board);
      await newPostRef.set(serializers.serializeWith(Board.serializer, board));

      var newGroup =
          api.state.groups.currentGroup.rebuild((GroupBuilder b) => b..boards[key] = true);
      api.actions.groups.updateGroup(newGroup);
      await refs.groupBoards(newGroup.uid).child(board.uid).set(true);
    };

_createUser(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateUserPayload> action,
    ) async {
      var payload = action.payload;
      var newPostRef = await refs.user(payload.uid);
      var user = new User((UserBuilder b) => b
        ..uid = payload.uid
        ..displayName = payload.displayName);

      api.actions.users.updateUser(user);
      await newPostRef.set(serializers.serializeWith(User.serializer, user));
      api.actions.ref.subToUser(user.uid);
    };

////////////////////
/// Util
///////////////////

BuiltMap<String, bool> _keyListToBuiltMap(Iterable<String> keys) {
  var map = new Map<String, bool>();
  for (String key in keys) map[key] = true;
  return new BuiltMap<String, bool>(map);
}
