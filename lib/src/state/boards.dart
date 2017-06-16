library boards;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/board.dart';

part 'boards.g.dart';

////////////////////
/// Actions
///////////////////

/// [BoardsActions]
abstract class BoardsActions extends ReduxActions {
  ActionDispatcher<Board> insertBoard;
  ActionDispatcher<Board> updateBoard;
    // update title
    // update description
    // add / remove User
    // create new Session
  ActionDispatcher<Board> removeBoard;

  // factory to create on instance of the generated implementation of BoardsActions
  BoardsActions._();
  factory BoardsActions() => new _$BoardsActions();
}

////////////////////
/// State
///////////////////

/// [Boards]
abstract class Boards extends BuiltReducer<Boards, BoardsBuilder>
    implements Built<Boards, BoardsBuilder> {
  /// [map] contains a map of board.id to Board
  BuiltMap<String, Board> get map;

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
      ..add<Board>(BoardsActionsNames.insertBoard, _setBoard)
      ..add<Board>(BoardsActionsNames.updateBoard, _setBoard)
      ..add<Board>(BoardsActionsNames.removeBoard, _unsetBoard))
    .build();

////////////////////
/// Reducers
///////////////////

_setBoard(Boards state, Action<Board> action, BoardsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_unsetBoard(Boards state, Action<Board> action, BoardsBuilder builder) =>
    builder..map.remove(action.payload.uid);
