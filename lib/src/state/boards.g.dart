// GENERATED CODE - DO NOT MODIFY BY HAND

part of boards;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class BoardsActions
// **************************************************************************

class _$BoardsActions extends BoardsActions {
  ActionDispatcher<Board> removeBoard =
      new ActionDispatcher<Board>('BoardsActions-removeBoard');

  ActionDispatcher<Board> updateBoard =
      new ActionDispatcher<Board>('BoardsActions-updateBoard');

  ActionDispatcher<Board> insertBoard =
      new ActionDispatcher<Board>('BoardsActions-insertBoard');
  factory _$BoardsActions() => new _$BoardsActions._();
  _$BoardsActions._() : super._();
  syncWithStore(dispatcher) {
    removeBoard.syncWithStore(dispatcher);
    updateBoard.syncWithStore(dispatcher);
    insertBoard.syncWithStore(dispatcher);
  }
}

class BoardsActionsNames {
  static ActionName removeBoard =
      new ActionName<Board>('BoardsActions-removeBoard');
  static ActionName updateBoard =
      new ActionName<Board>('BoardsActions-updateBoard');
  static ActionName insertBoard =
      new ActionName<Board>('BoardsActions-insertBoard');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Boards
// **************************************************************************

class _$Boards extends Boards {
  @override
  final BuiltMap<String, Board> map;

  factory _$Boards([void updates(BoardsBuilder b)]) =>
      (new BoardsBuilder()..update(updates)).build();

  _$Boards._({this.map}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  Boards rebuild(void updates(BoardsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardsBuilder toBuilder() => new BoardsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Boards) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Boards')..add('map', map)).toString();
  }
}

class BoardsBuilder implements Builder<Boards, BoardsBuilder> {
  _$Boards _$v;

  MapBuilder<String, Board> _map;
  MapBuilder<String, Board> get map =>
      _$this._map ??= new MapBuilder<String, Board>();
  set map(MapBuilder<String, Board> map) => _$this._map = map;

  BoardsBuilder();

  BoardsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
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
    final result = _$v ?? new _$Boards._(map: map?.build());
    replace(result);
    return result;
  }
}
