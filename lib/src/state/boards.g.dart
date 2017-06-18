// GENERATED CODE - DO NOT MODIFY BY HAND

part of boards;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class BoardsActions
// **************************************************************************

class _$BoardsActions extends BoardsActions {
  ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('BoardsActions-setCurrent');

  ActionDispatcher<Board> update =
      new ActionDispatcher<Board>('BoardsActions-update');
  factory _$BoardsActions() => new _$BoardsActions._();
  _$BoardsActions._() : super._();
  syncWithStore(dispatcher) {
    setCurrent.syncWithStore(dispatcher);
    update.syncWithStore(dispatcher);
  }
}

class BoardsActionsNames {
  static ActionName setCurrent =
      new ActionName<String>('BoardsActions-setCurrent');
  static ActionName update = new ActionName<Board>('BoardsActions-update');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Boards
// **************************************************************************

class _$Boards extends Boards {
  @override
  final BuiltMap<String, Board> map;
  @override
  final String currentUid;
  Board __current;

  factory _$Boards([void updates(BoardsBuilder b)]) =>
      (new BoardsBuilder()..update(updates)).build();

  _$Boards._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  Board get current => __current ??= super.current;

  @override
  Boards rebuild(void updates(BoardsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardsBuilder toBuilder() => new BoardsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Boards) return false;
    return map == other.map && currentUid == other.currentUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Boards')
          ..add('map', map)
          ..add('currentUid', currentUid))
        .toString();
  }
}

class BoardsBuilder implements Builder<Boards, BoardsBuilder> {
  _$Boards _$v;

  MapBuilder<String, Board> _map;
  MapBuilder<String, Board> get map =>
      _$this._map ??= new MapBuilder<String, Board>();
  set map(MapBuilder<String, Board> map) => _$this._map = map;

  String _currentUid;
  String get currentUid => _$this._currentUid;
  set currentUid(String currentUid) => _$this._currentUid = currentUid;

  BoardsBuilder();

  BoardsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentUid = _$v.currentUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Boards other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Boards;
  }

  @override
  void update(void updates(BoardsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Boards build() {
    final result =
        _$v ?? new _$Boards._(map: map?.build(), currentUid: currentUid);
    replace(result);
    return result;
  }
}
