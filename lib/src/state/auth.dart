library auth;

import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';
import 'package:firebase/firebase.dart' show User;

part 'auth.g.dart';

////////////////////
/// Actions
///////////////////

/// [AuthActions]
abstract class AuthActions extends ReduxActions {
  ActionDispatcher<User> logIn;

  // factory to create on instance of the generated implementation of AuthActions
  AuthActions._();
  factory AuthActions() => new _$AuthActions();
}

////////////////////
/// State
///////////////////

/// [Auth]
abstract class Auth extends BuiltReducer<Auth, AuthBuilder> implements Built<Auth, AuthBuilder> {
  /// [current] is the current user
  @nullable
  User get currentUser;

  /// [loggedIn]
  @memoized
  bool get loggedIn => currentUser != null;

  /// reducer
  get reducer => _reducer;

  // Built value boilerplate
  Auth._();
  factory Auth([updates(AuthBuilder b)]) => new _$Auth((AuthBuilder b) => b);
}

////////////////////
/// Main Reducer
///////////////////

var _reducer =
    (new ReducerBuilder<Auth, AuthBuilder>()..add<User>(AuthActionsNames.logIn, _logIn)).build();

////////////////////
/// Reducers
///////////////////

_logIn(Auth state, Action<User> action, AuthBuilder builder) =>
    builder..currentUser = action.payload;
