library subSpyMiddleware;

import 'package:built_redux/built_redux.dart';
import 'package:firebase/firebase.dart' as firebase;

import '../state/app.dart';
import '../state/users.dart';
import '../state/auth.dart';
import '../state/boards.dart';

import '../middleware/creationMiddleware.dart';

import '../models/user.dart';

createSubSpyMiddleware(firebase.Database db) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<firebase.User>(AuthActionsNames.logIn, _onLogin(db))
      ..add<User>(UsersActionsNames.updateUser, _onUpdateUser(db))
      ..add<Group>(GroupsActionsNames.updateGroup, _onUpdateGroup(db))
      ..add<BoardPayload>(BoardsActionsNames.setCurrentBoard, _onSetCurrentBoard(db))
      ..add<String>(GroupsActionsNames.setCurrentGroup, _onSetCurrentGroup(db)))
    .build();

_onLogin(firebase.Database db) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<firebase.User> action,
    ) async {
      next(action);
      final String uid = action.payload.uid;
      api.actions.users.setCurrentUser(uid);
      var user = await db.ref('users/$uid').once('value');

      if (user.snapshot.val() == null)
        api.actions.creation.user(new CreateUserPayload(uid, action.payload.displayName));
      else
        api.actions.ref.subToUser(uid);
    };

_onUpdateUser(firebase.Database db) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<User> action,
    ) {
      next(action);
      if (action.payload.uid == api.state.auth.currentUser.uid)
        api.actions.ref.updateGroupSubs(action.payload.groups.keys);
    };

_onUpdateGroup(firebase.Database db) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Group> action,
    ) {
      next(action);
      api.actions.ref.updateUserSubs(action.payload.users.keys);
    };

_onSetCurrentGroup(firebase.Database db) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      next(action);
      var payload = api.state.groups.currentGroup.boards.keys.map(
        (String key) => new BoardPayload(action.payload, key),
      );
      api.actions.ref.updateBoardSubs(payload);
    };

_onSetCurrentBoard(firebase.Database db) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<BoardPayload> action,
    ) {
      next(action);
      print("SUB WTF ${action.name} Group:\"${action.payload?.guid}\" Board:\"${action.payload?.buid}\"");
      api.actions.ref.subToBoard(action.payload);
      next(action);
    };
