library app;

import 'package:intl/intl.dart';

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

const String CREATE_CATEGORY_MODAL = "Create Category Modal";
const String CREATE_ITEM_MODAL = "Create Item Modal";
const String MANAGE_CONTENT_MODAL = "Manage Content Modal";
const String NO_MODAL = "No Modal";

int now() => new DateTime.now().millisecondsSinceEpoch;

final _dateFormat = new DateFormat.yMMMMd("en_US");
final _timeFormat = new DateFormat.Hm("en_US");

String date(int epoch) => _dateFormat.format(new DateTime.fromMillisecondsSinceEpoch(epoch));
String dateTime(int epoch) => "${time(epoch)} on ${date(epoch)}";
String time(int epoch) => _timeFormat.format(new DateTime.fromMillisecondsSinceEpoch(epoch));

////////////////////
/// Actions
///////////////////

/// [AppActions]
abstract class AppActions extends ReduxActions {
  ActionDispatcher<Null> clear;
  ActionDispatcher<String> showModal;
  ActionDispatcher<Null> hideModal;

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

  String get visibleModal;

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
    ..notes = new Notes().toBuilder()
    ..visibleModal = NO_MODAL);

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
}

////////////////////
/// Main Reducer
///////////////////

var _reducer =
    (new ReducerBuilder<App, AppBuilder>()
      ..add<Null>(AppActionsNames.clear, _clear)
      ..add<String>(AppActionsNames.showModal, _showModal)
      ..add<Null>(AppActionsNames.hideModal, _hideModal)
    ).build();

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

_showModal(App state, Action<String> action, AppBuilder builder) {
  switch(action.payload) {
    case CREATE_CATEGORY_MODAL:
    return builder..visibleModal = CREATE_CATEGORY_MODAL;
    case CREATE_ITEM_MODAL:
    return builder..visibleModal = CREATE_ITEM_MODAL;
    case MANAGE_CONTENT_MODAL:
    return builder..visibleModal = MANAGE_CONTENT_MODAL;
  }
  return builder..visibleModal = NO_MODAL;
}

_hideModal(App state, Action<String> action, AppBuilder builder) => builder
    ..visibleModal = NO_MODAL;
