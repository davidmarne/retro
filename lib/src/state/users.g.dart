// GENERATED CODE - DO NOT MODIFY BY HAND

part of users;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class UsersActions
// **************************************************************************

class _$UsersActions extends UsersActions {
  ActionDispatcher<String> setCurrentUser =
      new ActionDispatcher<String>('UsersActions-setCurrentUser');

  ActionDispatcher<User> updateUser =
      new ActionDispatcher<User>('UsersActions-updateUser');
  factory _$UsersActions() => new _$UsersActions._();
  _$UsersActions._() : super._();
  syncWithStore(dispatcher) {
    setCurrentUser.syncWithStore(dispatcher);
    updateUser.syncWithStore(dispatcher);
  }
}

class UsersActionsNames {
  static ActionName setCurrentUser =
      new ActionName<String>('UsersActions-setCurrentUser');
  static ActionName updateUser =
      new ActionName<User>('UsersActions-updateUser');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Users
// **************************************************************************

class _$Users extends Users {
  @override
  final BuiltMap<String, User> userMap;
  @override
  final String currentUserUid;
  User __currentUser;

  factory _$Users([void updates(UsersBuilder b)]) =>
      (new UsersBuilder()..update(updates)).build();

  _$Users._({this.userMap, this.currentUserUid}) : super._() {
    if (userMap == null) throw new ArgumentError.notNull('userMap');
    if (currentUserUid == null)
      throw new ArgumentError.notNull('currentUserUid');
  }

  @override
  User get currentUser => __currentUser ??= super.currentUser;

  @override
  Users rebuild(void updates(UsersBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersBuilder toBuilder() => new UsersBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Users) return false;
    return userMap == other.userMap && currentUserUid == other.currentUserUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userMap.hashCode), currentUserUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Users')
          ..add('userMap', userMap)
          ..add('currentUserUid', currentUserUid))
        .toString();
  }
}

class UsersBuilder implements Builder<Users, UsersBuilder> {
  _$Users _$v;

  MapBuilder<String, User> _userMap;
  MapBuilder<String, User> get userMap =>
      _$this._userMap ??= new MapBuilder<String, User>();
  set userMap(MapBuilder<String, User> userMap) => _$this._userMap = userMap;

  String _currentUserUid;
  String get currentUserUid => _$this._currentUserUid;
  set currentUserUid(String currentUserUid) =>
      _$this._currentUserUid = currentUserUid;

  UsersBuilder();

  UsersBuilder get _$this {
    if (_$v != null) {
      _userMap = _$v.userMap?.toBuilder();
      _currentUserUid = _$v.currentUserUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Users other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Users;
  }

  @override
  void update(void updates(UsersBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Users build() {
    final result = _$v ??
        new _$Users._(
            userMap: userMap?.build(), currentUserUid: currentUserUid);
    replace(result);
    return result;
  }
}
