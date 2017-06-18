library app;

import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import './auth.dart';
import './users.dart';
import './boards.dart';
import './sessions.dart';
import './categories.dart';
import './items.dart';
import './notes.dart';

import '../middleware/creationMiddleware.dart';

part 'app.g.dart';

////////////////////
/// Actions
///////////////////

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
    ..auth = new Auth().toBuilder()
    ..users = new Users().toBuilder()
    ..boards = new Boards().toBuilder()
    ..sessions = new Sessions().toBuilder()
    ..categories = new Categories().toBuilder()
    ..items = new Items().toBuilder()
    ..notes = new Notes().toBuilder());
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
  ..auth = new Auth().toBuilder()
  ..users = new Users().toBuilder()
  ..boards = new Boards().toBuilder()
  ..sessions = new Sessions().toBuilder()
  ..categories = new Categories().toBuilder()
  ..items = new Items().toBuilder()
  ..notes = new Notes().toBuilder();
