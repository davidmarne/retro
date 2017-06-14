library app;

import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_collection/built_collection.dart';
import './auth.dart';
import './users.dart';
import './groups.dart';
import './boards.dart';
import '../models/board.dart';
import '../middleware/creationMiddleware.dart';
import '../middleware/refMiddleware.dart';

part 'app.g.dart';

/// [AppActions]
abstract class AppActions extends ReduxActions {
  ActionDispatcher<Null> clear;

  AuthActions auth;
  BoardsActions boards;
  GroupsActions groups;
  UsersActions users;
  CreationMiddlewareActions creation;
  RefMiddlewareActions ref;

  // factory to create on instance of the generated implementation of AppActions
  AppActions._();
  factory AppActions() => new _$AppActions();
}

/// [App]
abstract class App extends BuiltReducer<App, AppBuilder>
    with AppReduceChildren
    implements Built<App, AppBuilder> {
  /// [auth]
  Auth get auth;

  /// [users]
  Users get users;

  /// [groups]
  Groups get groups;

  /// [boards]
  Boards get boards;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  App._();
  factory App([updates(AppBuilder b)]) => new _$App((AppBuilder b) => b
    ..auth = new Auth().toBuilder()
    ..users = new Users().toBuilder()
    ..groups = new Groups().toBuilder()
    ..boards = new Boards().toBuilder());

  // derived state
  // will only be recomputed when App is rebuilt

  @memoized
  BuiltMap<String, Board> get currentGroupBoardsMap => new BuiltMap(new Map<String, Board>.fromIterable(
    groups.currentGroup.boards.keys.where((buid) => boards.boardMap.containsKey(buid)),
  value: (buid) {
    return boards.boardMap[buid];
  }));

  @memoized
  Iterable<Board> get currentGroupBoards =>
      currentGroupBoardsMap == null ? [] : currentGroupBoardsMap.values;

  @memoized
  Board get mostRecentBoard => currentGroupBoards.length > 0 ? currentGroupBoards.first : null;

  @memoized
  Iterable<Board> get restOfBoards =>
      currentGroupBoards.length > 1 ? currentGroupBoards.skip(1) : [];
}

// combined reducer
var _reducer = (new ReducerBuilder<App, AppBuilder>()
      ..add<Null>(AppActionsNames.clear, _clear))
    .build();

// reducers

_clear(App state, Action<Null> action, AppBuilder builder) => builder
  ..auth = new Auth().toBuilder()
  ..users = new Users().toBuilder()
  ..groups = new Groups().toBuilder()
  ..boards = new Boards().toBuilder();
