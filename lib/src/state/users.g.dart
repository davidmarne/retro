// GENERATED CODE - DO NOT MODIFY BY HAND

part of users;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$Users extends Users {
  @override
  final BuiltMap<String, User> map;
  @override
  final String currentUid;
  User __current;
  bool __loggedIn;

  factory _$Users([void updates(UsersBuilder b)]) =>
      (new UsersBuilder()..update(updates)).build();

  _$Users._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  User get current => __current ??= super.current;

  @override
  bool get loggedIn => __loggedIn ??= super.loggedIn;

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
    final _$result =
        _$v ?? new _$Users._(map: map?.build(), currentUid: currentUid);
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$UsersActions extends UsersActions {
  final ActionDispatcher<String> addBoardToCurrentUser =
      new ActionDispatcher<String>('UsersActions-addBoardToCurrentUser');

  final ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('UsersActions-setCurrent');

  final ActionDispatcher<String> remove =
      new ActionDispatcher<String>('UsersActions-remove');

  final ActionDispatcher<User> update =
      new ActionDispatcher<User>('UsersActions-update');
  factory _$UsersActions() => new _$UsersActions._();

  _$UsersActions._() : super._();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    addBoardToCurrentUser.setDispatcher(dispatcher);
    setCurrent.setDispatcher(dispatcher);
    remove.setDispatcher(dispatcher);
    update.setDispatcher(dispatcher);
  }
}

class UsersActionsNames {
  static final ActionName<String> addBoardToCurrentUser =
      new ActionName<String>('UsersActions-addBoardToCurrentUser');
  static final ActionName<String> setCurrent =
      new ActionName<String>('UsersActions-setCurrent');
  static final ActionName<String> remove =
      new ActionName<String>('UsersActions-remove');
  static final ActionName<User> update =
      new ActionName<User>('UsersActions-update');
}
