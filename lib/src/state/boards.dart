library boards;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/board.dart';
import 'app.dart';

part 'boards.g.dart';

////////////////////
/// Actions
///////////////////

/// [BoardsActions]
abstract class BoardsActions extends ReduxActions {
  ActionDispatcher<Board> update;
  ActionDispatcher<String> remove;
  ActionDispatcher<String> setCurrent;
  // update title
  // update description
  // add / remove User
  // create new Session
  
  ActionDispatcher<Null> shred;

  // factory to create on instance of the generated implementation of BoardsActions
  BoardsActions._();
  factory BoardsActions() => new _$BoardsActions();
}

////////////////////
/// State
///////////////////

/// [Boards]
abstract class Boards implements Built<Boards, BoardsBuilder> {
  /// [map] contains a map of board.id to Board
  BuiltMap<String, Board> get map;

  String get currentUid;

  // Built value boilerplate
  Boards._();
  factory Boards([updates(BoardsBuilder b)]) =>
      new _$Boards((BoardsBuilder b) => b..currentUid = "");

  @memoized
  Board get current => map[currentUid];
}

////////////////////
/// Main Reducer
///////////////////

NestedReducerBuilder<App, AppBuilder, Boards, BoardsBuilder>
    createBoardsReducer() =>
        new NestedReducerBuilder<App, AppBuilder, Boards, BoardsBuilder>(
          (state) => state.boards,
          (builder) => builder.boards,
        )
          ..add<Board>(BoardsActionsNames.update, _updateBoard)
          ..add<String>(BoardsActionsNames.remove, _removeBoard)
          ..add<String>(BoardsActionsNames.setCurrent, _setCurrentBoard);

////////////////////
/// Reducers
///////////////////

_updateBoard(Boards state, Action<Board> action, BoardsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_removeBoard(Boards state, Action<String> action, BoardsBuilder builder) =>
    builder..map.remove(action.payload);

_setCurrentBoard(Boards state, Action<String> action, BoardsBuilder builder) =>
    builder..currentUid = action.payload;
