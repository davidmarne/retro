// GENERATED CODE - DO NOT MODIFY BY HAND

part of boards;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class BoardsActions
// **************************************************************************

class _$BoardsActions extends BoardsActions {
  ActionDispatcher<AddItemPayload> addItem =
      new ActionDispatcher<AddItemPayload>('BoardsActions-addItem');

  ActionDispatcher<dynamic> addCategory =
      new ActionDispatcher<dynamic>('BoardsActions-addCategory');

  ActionDispatcher<BoardPayload> setCurrentBoard =
      new ActionDispatcher<BoardPayload>('BoardsActions-setCurrentBoard');

  ActionDispatcher<String> removeBoard =
      new ActionDispatcher<String>('BoardsActions-removeBoard');

  ActionDispatcher<Board> updateBoard =
      new ActionDispatcher<Board>('BoardsActions-updateBoard');
  factory _$BoardsActions() => new _$BoardsActions._();
  _$BoardsActions._() : super._();
  syncWithStore(dispatcher) {
    addItem.syncWithStore(dispatcher);
    addCategory.syncWithStore(dispatcher);
    setCurrentBoard.syncWithStore(dispatcher);
    removeBoard.syncWithStore(dispatcher);
    updateBoard.syncWithStore(dispatcher);
  }
}

class BoardsActionsNames {
  static ActionName addItem =
      new ActionName<AddItemPayload>('BoardsActions-addItem');
  static ActionName addCategory =
      new ActionName<dynamic>('BoardsActions-addCategory');
  static ActionName setCurrentBoard =
      new ActionName<BoardPayload>('BoardsActions-setCurrentBoard');
  static ActionName removeBoard =
      new ActionName<String>('BoardsActions-removeBoard');
  static ActionName updateBoard =
      new ActionName<Board>('BoardsActions-updateBoard');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Boards
// **************************************************************************

class _$Boards extends Boards {
  @override
  final BuiltMap<String, Board> map;
  @override
  final String currentBoardUid;
  Board __currentBoard;
  bool __currentBoardIsSet;

  factory _$Boards([void updates(BoardsBuilder b)]) =>
      (new BoardsBuilder()..update(updates)).build();

  _$Boards._({this.map, this.currentBoardUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentBoardUid == null)
      throw new ArgumentError.notNull('currentBoardUid');
  }

  @override
  Board get currentBoard => __currentBoard ??= super.currentBoard;

  @override
  bool get currentBoardIsSet => __currentBoardIsSet ??= super.currentBoardIsSet;

  @override
  Boards rebuild(void updates(BoardsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardsBuilder toBuilder() => new BoardsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Boards) return false;
    return map == other.map && currentBoardUid == other.currentBoardUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentBoardUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Boards')
          ..add('map', map)
          ..add('currentBoardUid', currentBoardUid))
        .toString();
  }
}

class BoardsBuilder implements Builder<Boards, BoardsBuilder> {
  _$Boards _$v;

  MapBuilder<String, Board> _map;
  MapBuilder<String, Board> get map =>
      _$this._map ??= new MapBuilder<String, Board>();
  set map(MapBuilder<String, Board> map) => _$this._map = map;

  String _currentBoardUid;
  String get currentBoardUid => _$this._currentBoardUid;
  set currentBoardUid(String currentBoardUid) =>
      _$this._currentBoardUid = currentBoardUid;

  BoardsBuilder();

  BoardsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentBoardUid = _$v.currentBoardUid;
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
    final result = _$v ??
        new _$Boards._(map: map?.build(), currentBoardUid: currentBoardUid);
    replace(result);
    return result;
  }
}
