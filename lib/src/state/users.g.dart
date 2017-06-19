// GENERATED CODE - DO NOT MODIFY BY HAND

part of users;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class UsersActions
// **************************************************************************

class _$UsersActions extends UsersActions {
  ActionDispatcher<String> addBoardToCurrentUser =
      new ActionDispatcher<String>('UsersActions-addBoardToCurrentUser');

  ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('UsersActions-setCurrent');

  ActionDispatcher<User> update =
      new ActionDispatcher<User>('UsersActions-update');
  factory _$UsersActions() => new _$UsersActions._();
  _$UsersActions._() : super._();
  syncWithStore(dispatcher) {
    addBoardToCurrentUser.syncWithStore(dispatcher);
    setCurrent.syncWithStore(dispatcher);
    update.syncWithStore(dispatcher);
  }
}

class UsersActionsNames {
  static ActionName addBoardToCurrentUser =
      new ActionName<String>('UsersActions-addBoardToCurrentUser');
  static ActionName setCurrent =
      new ActionName<String>('UsersActions-setCurrent');
  static ActionName update = new ActionName<User>('UsersActions-update');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Users
// **************************************************************************

class _$Users extends Users {
  @override
  final BuiltMap<String, User> map;
  @override
  final String currentUid;
  User __current;

  factory _$Users([void updates(UsersBuilder b)]) =>
      (new UsersBuilder()..update(updates)).build();

  _$Users._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  User get current => __current ??= super.current;

  @override
  Users rebuild(void updates(UsersBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersBuilder toBuilder() => new UsersBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Users) return false;
    return map == other.map && currentUid == other.currentUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Users')
          ..add('map', map)
          ..add('currentUid', currentUid))
        .toString();
  }
}

class UsersBuilder implements Builder<Users, UsersBuilder> {
  _$Users _$v;

  MapBuilder<String, User> _map;
  MapBuilder<String, User> get map =>
      _$this._map ??= new MapBuilder<String, User>();
  set map(MapBuilder<String, User> map) => _$this._map = map;

  String _currentUid;
  String get currentUid => _$this._currentUid;
  set currentUid(String currentUid) => _$this._currentUid = currentUid;

  UsersBuilder();

  UsersBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentUid = _$v.currentUid;
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
    final result =
        _$v ?? new _$Users._(map: map?.build(), currentUid: currentUid);
    replace(result);
    return result;
  }
}
