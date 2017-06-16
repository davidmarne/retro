// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class AuthActions
// **************************************************************************

class _$AuthActions extends AuthActions {
  ActionDispatcher<User> logIn =
      new ActionDispatcher<User>('AuthActions-logIn');
  factory _$AuthActions() => new _$AuthActions._();
  _$AuthActions._() : super._();
  syncWithStore(dispatcher) {
    logIn.syncWithStore(dispatcher);
  }
}

class AuthActionsNames {
  static ActionName logIn = new ActionName<User>('AuthActions-logIn');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Auth
// **************************************************************************

class _$Auth extends Auth {
  @override
  final User currentUser;
  bool __loggedIn;

  factory _$Auth([void updates(AuthBuilder b)]) =>
      (new AuthBuilder()..update(updates)).build();

  _$Auth._({this.currentUser}) : super._();

  @override
  bool get loggedIn => __loggedIn ??= super.loggedIn;

  @override
  Auth rebuild(void updates(AuthBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthBuilder toBuilder() => new AuthBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Auth) return false;
    return currentUser == other.currentUser;
  }

  @override
  int get hashCode {
    return $jf($jc(0, currentUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Auth')
          ..add('currentUser', currentUser))
        .toString();
  }
}

class AuthBuilder implements Builder<Auth, AuthBuilder> {
  _$Auth _$v;

  User _currentUser;
  User get currentUser => _$this._currentUser;
  set currentUser(User currentUser) => _$this._currentUser = currentUser;

  AuthBuilder();

  AuthBuilder get _$this {
    if (_$v != null) {
      _currentUser = _$v.currentUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Auth other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Auth;
  }

  @override
  void update(void updates(AuthBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Auth build() {
    final result = _$v ?? new _$Auth._(currentUser: currentUser);
    replace(result);
    return result;
  }
}
