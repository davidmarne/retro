library sessions;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/session.dart';

part 'sessions.g.dart';

////////////////////
/// Actions
///////////////////

/// [SessionsActions]
abstract class SessionsActions extends ReduxActions {
  ActionDispatcher<Session> insertSession;
  ActionDispatcher<Session> updateSession;
    // update startDate
    // update endData
    // add Category
    // remove Category
  ActionDispatcher<Session> removeSession;

  // factory to create on instance of the generated implementation of BoardsActions
  SessionsActions._();
  factory SessionsActions() => new _$SessionsActions();
}

////////////////////
/// State
///////////////////

/// [Sessions]
abstract class Sessions extends BuiltReducer<Sessions, SessionsBuilder>
    implements Built<Sessions, SessionsBuilder> {
  /// [map] contains a map of Session uid to Session.
  BuiltMap<String, Session> get map;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Sessions._();
  factory Sessions([updates(SessionsBuilder b)]) => new _$Sessions((SessionsBuilder b) => b);
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Sessions, SessionsBuilder>()
      ..add<Session>(SessionsActionsNames.insertSession, _setSession)
      ..add<Session>(SessionsActionsNames.updateSession, _setSession)
      ..add<Session>(SessionsActionsNames.removeSession, _unsetSession))
    .build();

////////////////////
/// Reducers
///////////////////

_setSession(Sessions state, Action<Session> action, SessionsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_unsetSession(Sessions state, Action<Session> action, SessionsBuilder builder) =>
    builder..map.remove(action.payload.uid);
