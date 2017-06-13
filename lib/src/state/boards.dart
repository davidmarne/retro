library boards;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/board.dart';
import '../models/category.dart';
import '../models/item.dart';

part 'boards.g.dart';

////////////////////
/// Actions
///////////////////

/// [BoardsActions]
abstract class BoardsActions extends ReduxActions {
  ActionDispatcher<Board> updateBoard;
  ActionDispatcher<String> removeBoard;
  ActionDispatcher<AddCategoryPayload> addCategory;
  ActionDispatcher<AddItemPayload> addItem;

  // factory to create on instance of the generated implementation of BoardsActions
  BoardsActions._();
  factory BoardsActions() => new _$BoardsActions();
}

////////////////////
/// Payloads
///////////////////

class AddCategoryPayload {
  final String groupUid;
  final String boardUid;
  final Category category;
  AddCategoryPayload(this.groupUid, this.boardUid, this.category);
}

class AddItemPayload {
  final String groupUid;
  final String boardUid;
  final Item item;
  AddItemPayload(this.groupUid, this.boardUid, this.item);
}

////////////////////
/// State
///////////////////

/// [Boards]
abstract class Boards extends BuiltReducer<Boards, BoardsBuilder>
    implements Built<Boards, BoardsBuilder> {
  /// [boardMap] contains a map of board.id to Board
  BuiltMap<String, BuiltMap<String, Board>> get boardMap;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Boards._();
  factory Boards([updates(BoardsBuilder b)]) => new _$Boards((BoardsBuilder b) => b);
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Boards, BoardsBuilder>()
      ..add<Board>(BoardsActionsNames.updateBoard, _updateBoard)
      ..add<String>(BoardsActionsNames.removeBoard, _removeBoard)
      ..add<AddCategoryPayload>(BoardsActionsNames.addCategory, _addCategory)
      ..add<AddItemPayload>(BoardsActionsNames.addItem, _addItem))
    .build();

////////////////////
/// Reducers
///////////////////

_updateBoard(Boards state, Action<Board> action, BoardsBuilder builder) =>
    _updateBoardOnBuilder(action.payload, builder);

_addCategory(Boards state, Action<AddCategoryPayload> action, BoardsBuilder builder) =>
    _updateBoardOnBuilder(
      builder.boardMap[action.payload.groupUid][action.payload.boardUid].rebuild(
          (BoardBuilder b) => b..categories[action.payload.category.uid] = action.payload.category),
      builder,
    );

_addItem(Boards state, Action<AddItemPayload> action, BoardsBuilder builder) =>
    _updateBoardOnBuilder(
      builder.boardMap[action.payload.groupUid][action.payload.boardUid]
          .rebuild((BoardBuilder b) => b..items[action.payload.item.uid] = action.payload.item),
      builder,
    );

_updateBoardOnBuilder(Board board, BoardsBuilder builder) {
  var bmap = builder.boardMap[board.groupUid];
  if (bmap == null) {
    bmap = new BuiltMap<String, Board>();
  }

  return builder
    ..boardMap[board.groupUid] = bmap.rebuild(
      (MapBuilder b) => b[board.uid] = board,
    );
}

_removeBoard(Boards state, Action<String> action, BoardsBuilder builder) =>
    builder..boardMap.remove(action.payload);
