library users;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/user.dart';
import 'app.dart';

part 'users.g.dart';

////////////////////
/// Actions
///////////////////

/// [UsersActions]
abstract class UsersActions extends ReduxActions {
  ActionDispatcher<User> update;
  ActionDispatcher<String> remove;
  ActionDispatcher<String> setCurrent;

  ActionDispatcher<String> addBoardToCurrentUser;

  // factory to create on instance of the generated implementation of UsersActions
  UsersActions._();
  factory UsersActions() => new _$UsersActions();
}

////////////////////
/// State
///////////////////

/// [Users]
abstract class Users implements Built<Users, UsersBuilder> {
  /// [map] contains a map of user.id to User
  BuiltMap<String, User> get map;

  String get currentUid;

  // Built value boilerplate
  Users._();
  factory Users([updates(UsersBuilder b)]) =>
      new _$Users((UsersBuilder b) => b..currentUid = "");

  @memoized
  User get current => map[currentUid];

  @memoized
  bool get loggedIn => currentUid != "";
}

////////////////////
/// Main Reducer
///////////////////

NestedReducerBuilder<App, AppBuilder, Users, UsersBuilder>
    createUsersReducer() =>
        new NestedReducerBuilder<App, AppBuilder, Users, UsersBuilder>(
          (state) => state.users,
          (builder) => builder.users,
        )
          ..add<User>(UsersActionsNames.update, _updateUser)
          ..add<String>(UsersActionsNames.remove, _removeUser)
          ..add<String>(UsersActionsNames.setCurrent, _setCurrentUser);

////////////////////
/// Reducers
///////////////////

_updateUser(Users state, Action<User> action, UsersBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_removeUser(Users state, Action<String> action, UsersBuilder builder) =>
    builder..map.remove(action.payload);

_setCurrentUser(Users state, Action<String> action, UsersBuilder builder) =>
    builder..currentUid = action.payload;
