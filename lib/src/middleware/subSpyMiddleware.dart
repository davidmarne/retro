library subSpyMiddleware;

import 'package:built_redux/built_redux.dart';
import 'package:firebase/firebase.dart' as firebase;

import '../refs.dart';
import '../state/app.dart';
import '../state/users.dart';
import '../state/auth.dart';
import '../state/boards.dart';
import '../state/sessions.dart';

import '../middleware/creationMiddleware.dart';
import '../middleware/refMiddleware.dart';

import '../models/user.dart';

////////////////////
/// Action Map
///////////////////

createSubSpyMiddleware(Refs refs) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<firebase.User>(AuthActionsNames.logIn, _onLogin(refs))
      ..add<User>(UsersActionsNames.update, _onUpdateUser(refs))
      ..add<String>(UsersActionsNames.setCurrent, _setCurrentUser(refs))
      ..add(BoardsActionsNames.setCurrent, _setCurrentBoard(refs))
    ).build();

////////////////////
/// Handlers
///////////////////

_onLogin(Refs refs) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<firebase.User> action,
  ) async {
    next(action);
    final String uid = action.payload.uid;
    api.actions.users.setCurrent(uid);
    var user = await refs.user(uid).once('value');

    if (user.snapshot.val() == null)
      api.actions.creation.user(new CreateUserPayload(uid, action.payload.displayName));
    else
      api.actions.ref.subToUser(new SubPayload(uid));
  };

/// subscribe to the current user's boards
_onUpdateUser(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<User> action,
    ) {
      next(action);
      if (api.state.users.current != null && action.payload.uid == api.state.auth.currentUser.uid) {
        _subscribeToCurrentUserBoards(api);
      }
    };

/// subscribe to the current user's boards
_setCurrentUser(Refs refs) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<String> action,
  ) {
    next(action);
    if (api.state.users.current != null) {
      _subscribeToCurrentUserBoards(api);
    }
  };

_subscribeToCurrentUserBoards(MiddlewareApi<App, AppBuilder, AppActions> api) {
  api.actions.ref.updateBoardSubs(api.state.users.current.boardUids.keys.map((boardUid) {
    return new SubPayload(boardUid);
  }));
}

_setCurrentBoard(Refs refs) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<String> action,
  ) {
    next(action);
    if (api.state.boards.current != null) {
      _subscribeToCurrentBoardSessions(api);
    }
  };

_subscribeToCurrentBoardSessions(MiddlewareApi<App, AppBuilder, AppActions> api) {
  api.actions.ref.updateBoardSubs(api.state.users.current.boardUids.keys.map((boardUid) {
    return new SubPayload(boardUid);
  }));
}

// TODO: decide if necessary
_onSetCurrentBoard(Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<BoardPayload> action,
    ) {
      next(action);
      print("SUB WTF ${action.name} Group:\"${action.payload?.guid}\" Board:\"${action.payload?.buid}\"");
      api.actions.ref.subToBoard(action.payload);
      next(action);
    };
