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
  ActionDispatcher<Board> update;
  ActionDispatcher<String> setCurrent;
    // update title
    // update description
    // add / remove User
    // create new Session

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

  String get currentUid;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Boards._();
  factory Boards([updates(BoardsBuilder b)]) => new _$Boards((BoardsBuilder b) => b..currentUid = "");

  @memoized
  Board get current => map[currentUid];
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Boards, BoardsBuilder>()
      ..add<Board>(BoardsActionsNames.update, _updateBoard)
      ..add<String>(BoardsActionsNames.setCurrent, _setCurrentBoard))
    .build();

////////////////////
/// Reducers
///////////////////

_updateBoard(Boards state, Action<Board> action, BoardsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_setCurrentBoard(Boards state, Action<String> action, BoardsBuilder builder) =>
    builder..currentUid = action.payload;
