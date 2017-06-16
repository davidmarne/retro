library users;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/user.dart';

part 'users.g.dart';

/// [UsersActions]
abstract class UsersActions extends ReduxActions {
  ActionDispatcher<User> update;
  ActionDispatcher<String> setCurrent;

  // factory to create on instance of the generated implementation of UsersActions
  UsersActions._();
  factory UsersActions() => new _$UsersActions();
}

/// [Users]
abstract class Users extends BuiltReducer<Users, UsersBuilder>
    implements Built<Users, UsersBuilder> {
  /// [map] contains a map of user.id to User
  BuiltMap<String, User> get map;

  String get currentUid;

  /// reducer
  get reducer => _reducer;

  // Built value boilerplate
  Users._();
  factory Users([updates(UsersBuilder b)]) =>
      new _$Users((UsersBuilder b) => b..currentUid = "");

  @memoized
  User get current => map[currentUid];
}

// reducer
var _reducer = (new ReducerBuilder<Users, UsersBuilder>()
      ..add<User>(UsersActionsNames.update, _updateUser)
      ..add<String>(UsersActionsNames.setCurrent, _setCurrentUser))
    .build();

// reducers

_updateUser(Users state, Action<User> action, UsersBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_setCurrentUser(Users state, Action<String> action, UsersBuilder builder) =>
    builder..currentUid = action.payload;
