library creationMiddleware;

import 'package:built_redux/built_redux.dart';
import 'package:built_collection/built_collection.dart';

import '../refs.dart';
import '../state/app.dart';
import '../state/boards.dart';
import '../models/group.dart';
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
  ActionDispatcher<CreateGroupPayload> group;
  ActionDispatcher<CreateBoardPayload> board;
  ActionDispatcher<CreateUserPayload> user;
  ActionDispatcher<CreateCategoryPayload> category;
  ActionDispatcher<CreateItemPayload> item;

  CreationMiddlewareActions._();
  factory CreationMiddlewareActions() => new _$CreationMiddlewareActions();
}

////////////////////
/// Payloads
///////////////////

class CreateGroupPayload {
  final String displayName;
  final String description;
  final Iterable<String> users;
  CreateGroupPayload(this.displayName, this.description, this.users);
}

class CreateBoardPayload {
  final String displayName;
  final String description;
  final String groupUid;
  final int startDate;
  final int endDate;
  CreateBoardPayload(
      this.displayName, this.description, this.groupUid, this.startDate, this.endDate);
}

class CreateUserPayload {
  final String uid;
  final String displayName;
  CreateUserPayload(this.uid, this.displayName);
}

class CreateCategoryPayload {
  final String groupUid;
  final String boardUid;
  final String title;
  final String color;
  CreateCategoryPayload(this.groupUid, this.boardUid, this.title, this.color);
}

class CreateItemPayload {
  final String groupUid;
  final String boardUid;
  final String text;
  final String categoryUid;
  CreateItemPayload(this.groupUid, this.boardUid, this.text, this.categoryUid);
}

////////////////////
/// Action Map
///////////////////

createCreationMiddleware(Refs refs) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<CreateGroupPayload>(CreationMiddlewareActionsNames.group, _createGroup(refs))
      ..add<CreateBoardPayload>(CreationMiddlewareActionsNames.board, _createBoard(refs))
      ..add<CreateUserPayload>(CreationMiddlewareActionsNames.user, _createUser(refs))
      ..add<CreateCategoryPayload>(CreationMiddlewareActionsNames.category, _createCategory(refs))
      ..add<CreateItemPayload>(CreationMiddlewareActionsNames.item, _createItem(refs)))
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
