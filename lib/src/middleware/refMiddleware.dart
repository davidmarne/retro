import 'package:built_redux/built_redux.dart';

import '../state/app.dart';
import '../state/users.dart';
import '../state/boards.dart';
import '../state/sessions.dart';
import '../firebaseClient.dart';
import '../models/user.dart';
import '../models/board.dart';

////////////////////
/// Action Map
///////////////////

createRefMiddleware(FirebaseClient client) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<String>(UsersActionsNames.setCurrent, _onSetCurrentUser(client))
      ..add<User>(UsersActionsNames.update, _onUpdateUser(client))
      ..add<Board>(BoardsActionsNames.update, _onUpdateBoard(client))
      ..add<String>(BoardsActionsNames.setCurrent, _onSetCurrentBoard(client))
      ..add<String>(SessionsActionsNames.setCurrent, _onSetCurrentSession(client)))
    .build();

////////////////////
/// Handlers
///////////////////

_onSetCurrentUser(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      next(action);
      client.subToUser(action.payload);
    };

/// subscribe to the current user's boards
_onUpdateUser(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<User> action,
    ) {
      next(action);
      if (action.payload.uid == api.state.users.currentUid)
        client.subToBoards(api.state.users.current.boardUids.keys);
    };

/// subscribe to the current boards's users
_onUpdateBoard(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Board> action,
    ) {
      next(action);
      if (action.payload.uid == api.state.boards.currentUid)
        client.subToUsers(api.state.boards.current.memberUids.keys);
    };

_onSetCurrentBoard(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      // TODO: unsub from old board?

      next(action);
      client.subToSessions(action.payload);

      // after refresh current board can be set without the board yet being set
      if (api.state.boards.current != null)
        client.subToUsers(api.state.boards.current.memberUids.keys);
    };

_onSetCurrentSession(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      // TODO: unsub from old session?

      next(action);
      final currentSession = api.state.sessions.current;
      final boardUid = currentSession.boardUid;
      final sessionUid = currentSession.uid;
      client.subToItems(boardUid, sessionUid);
      client.subToCategories(boardUid);
      client.subToNotes(boardUid, sessionUid);
    };
