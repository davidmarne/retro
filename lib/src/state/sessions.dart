library sessions;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/session.dart';
import 'app.dart';

part 'sessions.g.dart';

////////////////////
/// Actions
///////////////////

/// [SessionsActions]
abstract class SessionsActions extends ReduxActions {
  ActionDispatcher<Session> update;
  ActionDispatcher<String> remove;
  ActionDispatcher<String> setCurrent;
  // update startDate
  // update endData
  // add Category
  // remove Category
  ActionDispatcher<Null> start;
  ActionDispatcher<Null> end;
  ActionDispatcher<Null> reset;
  ActionDispatcher<String> present; // uid of item to be presented.
  ActionDispatcher<Null> shred;

  // factory to create on instance of the generated implementation of BoardsActions
  SessionsActions._();
  factory SessionsActions() => new _$SessionsActions();
}

////////////////////
/// State
///////////////////

/// [Sessions]
abstract class Sessions implements Built<Sessions, SessionsBuilder> {
  /// [map] contains a map of Session uid to Session.
  BuiltMap<String, Session> get map;

  String get currentUid;

  // Built value boilerplate
  Sessions._();
  factory Sessions([updates(SessionsBuilder b)]) =>
      new _$Sessions((SessionsBuilder b) => b..currentUid = "");

  @memoized
  Session get current => map[currentUid];
}

////////////////////
/// Main Reducer
///////////////////

NestedReducerBuilder<App, AppBuilder, Sessions, SessionsBuilder>
    createSessionsReducer() =>
        new NestedReducerBuilder<App, AppBuilder, Sessions, SessionsBuilder>(
          (state) => state.sessions,
          (builder) => builder.sessions,
        )
          ..add<Session>(SessionsActionsNames.update, _updateSession)
          ..add<String>(SessionsActionsNames.remove, _removeSession)
          ..add<String>(SessionsActionsNames.setCurrent, _setCurrentSession);

////////////////////
/// Reducers
///////////////////

_updateSession(
        Sessions state, Action<Session> action, SessionsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_removeSession(
        Sessions state, Action<String> action, SessionsBuilder builder) =>
    builder..map.remove(action.payload);

_setCurrentSession(
        Sessions state, Action<String> action, SessionsBuilder builder) =>
    builder..currentUid = action.payload;
