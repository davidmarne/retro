library app;

import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_collection/built_collection.dart';

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

part 'app.g.dart';

////////////////////
/// Actions
///////////////////

/// [AppActions]
abstract class AppActions extends ReduxActions {
  ActionDispatcher<Null> clear;

  UsersActions users;
  BoardsActions boards;
  SessionsActions sessions;
  CategoriesActions categories;
  ItemsActions items;
  NotesActions notes;

  CreationMiddlewareActions creation;

  // factory to create on instance of the generated implementation of AppActions
  AppActions._();
  factory AppActions() => new _$AppActions();
}

////////////////////
/// State
///////////////////

/// [App]
abstract class App extends BuiltReducer<App, AppBuilder>
    with AppReduceChildren
    implements Built<App, AppBuilder> {
  /// [users]
  Users get users;

  /// [boards]
  Boards get boards;
  // Notes: sub to multiple boards to get board names and data for
  // each of a user's boards on dashboard.

  /// [Sessions]
  Sessions get sessions;
  // Notes: likely only need one session sub at a time. List of Sessions
  // could just have a timestamp for the session (available on board object).

  /// [Categories]
  Categories get categories;

  /// [Items]
  Items get items;

  /// [Notes]
  Notes get notes;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  App._();
  factory App([updates(AppBuilder b)]) => new _$App((AppBuilder b) => b
    ..users = new Users().toBuilder()
    ..boards = new Boards().toBuilder()
    ..sessions = new Sessions().toBuilder()
    ..categories = new Categories().toBuilder()
    ..items = new Items().toBuilder()
    ..notes = new Notes().toBuilder());

  // TODO: do this or clear sessions everytime current board changes?
  @memoized
  BuiltList<Session> get currentBoardSessions =>
      new BuiltList<Session>(
        sessions.map.values.where((Session s) => s.boardUid == boards.currentUid),
      );

  @memoized
  Board get usersLatestBoard {
    String maxUid = "";
    int maxTime = 0;
    users.current.boardUids.forEach((uid, time) {
      if (time > maxTime) {
        maxUid = uid;
        maxTime = time;
      }
    });
    return boards.map[maxUid];
  }

  @memoized
  Session get boardsLatestSession => sessions.map[boards.current.latestSessionUid];

  @memoized
  BuiltList<Category> get currentSessionCategories =>
      new BuiltList<Category>(
        categories.map.values.where((Category c) => c.sessionUid == sessions.currentUid),
      );

  @memoized
  BuiltList<Item> get currentSessionItems =>
      new BuiltList<Item>(
        items.map.values.where((Item i) => i.sessionUid == sessions.currentUid),
      );

  @memoized
  BuiltList<Note> get currentSessionNotes =>
      new BuiltList<Note>(
        notes.map.values.where((Note n) => n.sessionUid == sessions.currentUid),
      );

  String time(int time) => timeFormat.format(new DateTime.fromMillisecondsSinceEpoch(time));

  String date(int date) => dateFormat.format(new DateTime.fromMillisecondsSinceEpoch(date));
}

////////////////////
/// Main Reducer
///////////////////

var _reducer =
    (new ReducerBuilder<App, AppBuilder>()..add<Null>(AppActionsNames.clear, _clear)).build();

////////////////////
/// Reducers
///////////////////

_clear(App state, Action<Null> action, AppBuilder builder) => builder
  ..users = new Users().toBuilder()
  ..boards = new Boards().toBuilder()
  ..sessions = new Sessions().toBuilder()
  ..categories = new Categories().toBuilder()
  ..items = new Items().toBuilder()
  ..notes = new Notes().toBuilder();
