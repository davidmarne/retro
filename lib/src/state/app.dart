library app;

import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_collection/built_collection.dart';

import './auth.dart';
import './users.dart';
import './boards.dart';
import './sessions.dart';
import './categories.dart';
import './items.dart';
import './notes.dart';

import '../models/board.dart';
import '../models/session.dart';
import '../models/category.dart';
import '../models/item.dart';

import '../middleware/creationMiddleware.dart';
import '../middleware/refMiddleware.dart';

part 'app.g.dart';

/// [AppActions]
abstract class AppActions extends ReduxActions {
  ActionDispatcher<Null> clear;

  AuthActions auth;
  UsersActions users;
  BoardsActions boards;
  SessionsActions sessions;
  CategoriesActions categories;
  ItemsActions items;
  NotesActions notes;

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

  /// [boards]
  Boards get boards; // TODO: likely only need one board sub at a time.

  /// [Sessions]
  Sessions get sessions; // TODO: likely only need one session sub at a time.

  /// [Categories]
  Categories get categories;

  /// [Items]
  Items get items;

  /// [Notes]
  Notes get notes;

  String get currentBoardUid;

  String get currentSessionUid;

  String get currentCategoryUid;

  String get currentItemUid;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  App._();
  factory App([updates(AppBuilder b)]) => new _$App((AppBuilder b) => b
    ..auth = new Auth().toBuilder()
    ..users = new Users().toBuilder()
    ..boards = new Boards().toBuilder()
    ..sessions = new Sessions().toBuilder()
    ..categories = new Categories().toBuilder()
    ..items = new Items().toBuilder()
    ..notes = new Notes().toBuilder());

  // derived state
  // will only be recomputed when App is rebuilt

  Board get currentBoard => boards.map[currentBoardUid];

  Session get currentSession => sessions.map[currentSessionUid];

  Category get currentCategory => categories.map[currentCategoryUid];

  Item get currentItem => items.map[currentItemUid];

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
