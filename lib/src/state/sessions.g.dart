// GENERATED CODE - DO NOT MODIFY BY HAND

part of sessions;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class SessionsActions
// **************************************************************************

class _$SessionsActions extends SessionsActions {
  ActionDispatcher<Session> removeSession =
      new ActionDispatcher<Session>('SessionsActions-removeSession');

  ActionDispatcher<Session> updateSession =
      new ActionDispatcher<Session>('SessionsActions-updateSession');

  ActionDispatcher<Session> insertSession =
      new ActionDispatcher<Session>('SessionsActions-insertSession');
  factory _$SessionsActions() => new _$SessionsActions._();
  _$SessionsActions._() : super._();
  syncWithStore(dispatcher) {
    removeSession.syncWithStore(dispatcher);
    updateSession.syncWithStore(dispatcher);
    insertSession.syncWithStore(dispatcher);
  }
}

class SessionsActionsNames {
  static ActionName removeSession =
      new ActionName<Session>('SessionsActions-removeSession');
  static ActionName updateSession =
      new ActionName<Session>('SessionsActions-updateSession');
  static ActionName insertSession =
      new ActionName<Session>('SessionsActions-insertSession');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Sessions
// **************************************************************************

class _$Sessions extends Sessions {
  @override
  final BuiltMap<String, Session> map;

  factory _$Sessions([void updates(SessionsBuilder b)]) =>
      (new SessionsBuilder()..update(updates)).build();

  _$Sessions._({this.map}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  Sessions rebuild(void updates(SessionsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionsBuilder toBuilder() => new SessionsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sessions) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sessions')..add('map', map))
        .toString();
  }
}

class SessionsBuilder implements Builder<Sessions, SessionsBuilder> {
  _$Sessions _$v;

  MapBuilder<String, Session> _map;
  MapBuilder<String, Session> get map =>
      _$this._map ??= new MapBuilder<String, Session>();
  set map(MapBuilder<String, Session> map) => _$this._map = map;

  SessionsBuilder();

  SessionsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
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
    final result = _$v ?? new _$Sessions._(map: map?.build());
    replace(result);
    return result;
  }
}
