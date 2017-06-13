// GENERATED CODE - DO NOT MODIFY BY HAND

part of boards;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class BoardsActions
// **************************************************************************

class _$BoardsActions extends BoardsActions {
  ActionDispatcher<AddItemPayload> addItem =
      new ActionDispatcher<AddItemPayload>('BoardsActions-addItem');

  ActionDispatcher<AddCategoryPayload> addCategory =
      new ActionDispatcher<AddCategoryPayload>('BoardsActions-addCategory');

  ActionDispatcher<String> removeBoard =
      new ActionDispatcher<String>('BoardsActions-removeBoard');

  ActionDispatcher<Board> updateBoard =
      new ActionDispatcher<Board>('BoardsActions-updateBoard');
  factory _$BoardsActions() => new _$BoardsActions._();
  _$BoardsActions._() : super._();
  syncWithStore(dispatcher) {
    addItem.syncWithStore(dispatcher);
    addCategory.syncWithStore(dispatcher);
    removeBoard.syncWithStore(dispatcher);
    updateBoard.syncWithStore(dispatcher);
  }
}

class BoardsActionsNames {
  static ActionName addItem =
      new ActionName<AddItemPayload>('BoardsActions-addItem');
  static ActionName addCategory =
      new ActionName<AddCategoryPayload>('BoardsActions-addCategory');
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
  final BuiltMap<String, BuiltMap<String, Board>> boardMap;

  factory _$Boards([void updates(BoardsBuilder b)]) =>
      (new BoardsBuilder()..update(updates)).build();

  _$Boards._({this.boardMap}) : super._() {
    if (boardMap == null) throw new ArgumentError.notNull('boardMap');
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
    return boardMap == other.boardMap;
  }

  @override
  int get hashCode {
    return $jf($jc(0, boardMap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Boards')..add('boardMap', boardMap))
        .toString();
  }
}

class BoardsBuilder implements Builder<Boards, BoardsBuilder> {
  _$Boards _$v;

  MapBuilder<String, BuiltMap<String, Board>> _boardMap;
  MapBuilder<String, BuiltMap<String, Board>> get boardMap =>
      _$this._boardMap ??= new MapBuilder<String, BuiltMap<String, Board>>();
  set boardMap(MapBuilder<String, BuiltMap<String, Board>> boardMap) =>
      _$this._boardMap = boardMap;

  BoardsBuilder();

  BoardsBuilder get _$this {
    if (_$v != null) {
      _boardMap = _$v.boardMap?.toBuilder();
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
    final result = _$v ?? new _$Boards._(boardMap: boardMap?.build());
    replace(result);
    return result;
  }
}
