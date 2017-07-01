import 'package:built_redux/built_redux.dart';

import '../state/app.dart';
import '../state/users.dart';
import '../state/boards.dart';
import '../state/sessions.dart';
import '../firebaseClient.dart';
import '../models/user.dart';
import '../models/board.dart';
import '../models/session.dart';
import '../state/items.dart';

////////////////////
/// Action Map
///////////////////

createRefMiddleware(FirebaseClient client) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<String>(ItemsActionsNames.addSupport, _addSupport(client))
      ..add<String>(ItemsActionsNames.removeSupport, _removeSupport(client))
      ..add<String>(UsersActionsNames.setCurrent, _onSetCurrentUser(client))
      ..add<User>(UsersActionsNames.update, _onUpdateUser(client))
      ..add<Board>(BoardsActionsNames.update, _onUpdateBoard(client))
      ..add<String>(BoardsActionsNames.setCurrent, _onSetCurrentBoard(client))
      ..add<Session>(SessionsActionsNames.update, _onUpdateSession(client))
      ..add<String>(SessionsActionsNames.setCurrent, _onSetCurrentSession(client)))
    .build();

////////////////////
/// Handlers
///////////////////

// Update handlers

/// subscribe to the current user's boards
_onUpdateUser(FirebaseClient client) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<User> action) {
  next(action);
  if (action.payload.uid == api.state.users.currentUid) {
    _updateCurrentUserSubs(client, api);
  }
};

/// subscribe to the current boards's users
_onUpdateBoard(FirebaseClient client) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<Board> action) {
  next(action);
  if (action.payload.uid == api.state.boards.currentUid) {
    _updateCurrentBoardSubs(client, api);
  }
};

/// subscribe to the current boards's users
_onUpdateSession(FirebaseClient client) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<Session> action) {
  next(action);
  if (action.payload.uid == api.state.sessions.currentUid) {
    _updateCurrentSessionSubs(client, api);
  }
};

// Set current handlers

_onSetCurrentUser(FirebaseClient client) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<String> action) {
  next(action);
  _updateCurrentUserSubs(client, api);
};

// TODO: unsub from old board?
_onSetCurrentBoard(FirebaseClient client) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<String> action) {
  next(action);
  _updateCurrentBoardSubs(client, api);

  var userUid = api.state.users.currentUid;
  var boardUid = api.state.boards.currentUid;
  if (userUid != "" && boardUid != "") {
    client.setUsersLatestBoard(userUid, boardUid);
  }
};

// TODO: unsub from old session?
_onSetCurrentSession(FirebaseClient client) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<String> action) {
  next(action);
  _updateCurrentSessionSubs(client, api);
};

_addSupport(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    var userUid = api.state.users.currentUid;
    var boardUid = api.state.boards.currentUid;
    var sessionUid = api.state.sessions.currentUid;
    var itemUid = action.payload;
    return client.addSupport(userUid, boardUid, sessionUid, itemUid);
  };

_removeSupport(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    var userUid = api.state.users.currentUid;
    var boardUid = api.state.boards.currentUid;
    var sessionUid = api.state.sessions.currentUid;
    var itemUid = action.payload;
    return client.removeSupport(userUid, boardUid, sessionUid, itemUid);
  };


// Shared functionality

_updateCurrentUserSubs(FirebaseClient client, MiddlewareApi<App, AppBuilder, AppActions> api) {
  var user = api.state.users.current;
  if (user != null) {
    client.subToBoards(user.boardUids.keys);
  }
}

_updateCurrentBoardSubs(FirebaseClient client, MiddlewareApi<App, AppBuilder, AppActions> api) {
  var board = api.state.boards.current;
  if (board != null) {
    client.subToSessions(board.uid);
    client.subToUsers(board.memberUids.keys);
  }
}

_updateCurrentSessionSubs(FirebaseClient client, MiddlewareApi<App, AppBuilder, AppActions> api) {
  var session = api.state.sessions.current;
  if (session != null) {
    client.subToCategories(session.boardUid, session.uid);
    client.subToItems(session.boardUid, session.uid);
    client.subToNotes(session.boardUid, session.uid);
  }
}
