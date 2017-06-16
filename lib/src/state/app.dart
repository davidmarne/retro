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
import '../models/note.dart';

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
  Boards get boards;
    // Notes: sub to multiple boards to get board names and data for
    // each of a user's boards on dashboard.

  /// [Sessions]
  Sessions get sessions;
    // Notes: likely only need one session sub at a time. List of Sessions
    // could simply have a timestamp for the session (available on board object).

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

  Board get currentBoard => boards.map[currentBoardUid];

  Session get currentSession => sessions.map[currentSessionUid];

  Category get currentCategory => categories.map[currentCategoryUid];

  Item get currentItem => items.map[currentItemUid];

  // derived state
  // will only be recomputed when App is rebuilt

  @memoized
  BuiltList<Category> get boardCategories {
    if (currentBoard == null) return new BuiltList<Category>();
    return new BuiltList<Category>(categories.map.values.where((cat) => cat.boardUid == currentBoardUid));
  }

  @memoized
  BuiltList<Category> get sessionCategories {
    if (currentSession == null) return new BuiltList<Category>();
    return new BuiltList<Category>(currentSession.categoryUids.keys
      .where((key) => categories.map.containsKey(key))
      .map((key) => categories.map[key]));
  }

  @memoized
  BuiltList<Note> get sessionNotes {
    if (currentSession == null) return new BuiltList<Note>();
    return new BuiltList<Note>(notes.map.values
      .where((note) => note.sessionUid == note.sessionUid));
  }
 
  @memoized
  BuiltMap<Category, BuiltList<Item>> get categoryItems {
    if (currentBoard == null) return new BuiltMap<Category, BuiltList<Item>>();
    return new BuiltMap<Category, BuiltList<Item>>(categories.map.values
      .where((cat) => cat.boardUid == currentBoardUid)
      .map((cat) => new BuiltList<Item>(items.map.values
        .where((item) => item.categoryUid == cat.uid))));
  }
}

// combined reducer
var _reducer = (new ReducerBuilder<App, AppBuilder>()
      ..add<Null>(AppActionsNames.clear, _clear))
    .build();

// reducers

_clear(App state, Action<Null> action, AppBuilder builder) => builder
  ..auth = new Auth().toBuilder()
  ..users = new Users().toBuilder()
  ..boards = new Boards().toBuilder()
  ..sessions = new Sessions().toBuilder()
  ..categories = new Categories().toBuilder()
  ..items = new Items().toBuilder()
  ..notes = new Notes().toBuilder();
