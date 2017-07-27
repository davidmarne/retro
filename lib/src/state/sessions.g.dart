// GENERATED CODE - DO NOT MODIFY BY HAND

part of sessions;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class SessionsActions
// **************************************************************************

class _$SessionsActions extends SessionsActions {
  ActionDispatcher<Null> shred =
      new ActionDispatcher<Null>('SessionsActions-shred');

  ActionDispatcher<String> present =
      new ActionDispatcher<String>('SessionsActions-present');

  ActionDispatcher<Null> reset =
      new ActionDispatcher<Null>('SessionsActions-reset');

  ActionDispatcher<Null> end =
      new ActionDispatcher<Null>('SessionsActions-end');

  ActionDispatcher<Null> start =
      new ActionDispatcher<Null>('SessionsActions-start');

  ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('SessionsActions-setCurrent');

  ActionDispatcher<String> remove =
      new ActionDispatcher<String>('SessionsActions-remove');

  ActionDispatcher<Session> update =
      new ActionDispatcher<Session>('SessionsActions-update');
  factory _$SessionsActions() => new _$SessionsActions._();
  _$SessionsActions._() : super._();
  syncWithStore(dispatcher) {
    shred.syncWithStore(dispatcher);
    present.syncWithStore(dispatcher);
    reset.syncWithStore(dispatcher);
    end.syncWithStore(dispatcher);
    start.syncWithStore(dispatcher);
    setCurrent.syncWithStore(dispatcher);
    remove.syncWithStore(dispatcher);
    update.syncWithStore(dispatcher);
  }
}

class SessionsActionsNames {
  static ActionName shred = new ActionName<Null>('SessionsActions-shred');
  static ActionName present = new ActionName<String>('SessionsActions-present');
  static ActionName reset = new ActionName<Null>('SessionsActions-reset');
  static ActionName end = new ActionName<Null>('SessionsActions-end');
  static ActionName start = new ActionName<Null>('SessionsActions-start');
  static ActionName setCurrent =
      new ActionName<String>('SessionsActions-setCurrent');
  static ActionName remove = new ActionName<String>('SessionsActions-remove');
  static ActionName update = new ActionName<Session>('SessionsActions-update');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Sessions
// **************************************************************************

class _$Sessions extends Sessions {
  @override
  final BuiltMap<String, Session> map;
  @override
  final String currentUid;
  Session __current;

  factory _$Sessions([void updates(SessionsBuilder b)]) =>
      (new SessionsBuilder()..update(updates)).build();

  _$Sessions._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  Session get current => __current ??= super.current;

  @override
  Sessions rebuild(void updates(SessionsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionsBuilder toBuilder() => new SessionsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sessions) return false;
    return map == other.map && currentUid == other.currentUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sessions')
          ..add('map', map)
          ..add('currentUid', currentUid))
        .toString();
  }
}

class SessionsBuilder implements Builder<Sessions, SessionsBuilder> {
  _$Sessions _$v;

  MapBuilder<String, Session> _map;
  MapBuilder<String, Session> get map =>
      _$this._map ??= new MapBuilder<String, Session>();
  set map(MapBuilder<String, Session> map) => _$this._map = map;

  String _currentUid;
  String get currentUid => _$this._currentUid;
  set currentUid(String currentUid) => _$this._currentUid = currentUid;

  SessionsBuilder();

  SessionsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentUid = _$v.currentUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sessions other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Sessions;
  }

  @override
  void update(void updates(SessionsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Sessions build() {
    final result =
        _$v ?? new _$Sessions._(map: map?.build(), currentUid: currentUid);
    replace(result);
    return result;
  }
}
