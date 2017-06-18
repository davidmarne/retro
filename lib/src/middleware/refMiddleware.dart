import 'package:built_redux/built_redux.dart';
import 'package:firebase/firebase.dart' as firebase;

import '../state/app.dart';
import '../state/auth.dart';
import '../state/users.dart';
import '../state/boards.dart';
import '../state/sessions.dart';
import './creationMiddleware.dart';

import '../streamSubManager.dart';
import '../refs.dart';
import '../models/user.dart';
import '../models/board.dart';
import '../models/session.dart';
import '../models/category.dart';
import '../models/item.dart';
import '../models/note.dart';

////////////////////
/// Action Map
///////////////////

createRefMiddleware(StreamSubManager subMgr, Refs refs) =>
    (new MiddlwareBuilder<App, AppBuilder, AppActions>()
          ..add<firebase.User>(AuthActionsNames.logIn, _onLogin(refs))
          ..add<String>(UsersActionsNames.setCurrent, _onSetCurrentUser(subMgr, refs))
          ..add<User>(UsersActionsNames.update, _onUpdateUser(subMgr, refs))
          ..add<String>(BoardsActionsNames.setCurrent, _onSetCurrentBoard(subMgr, refs))
          ..add<String>(SessionsActionsNames.setCurrent, _onSetCurrentSession(subMgr, refs)))
        .build();

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
      var user = await refs.user(uid).once('value');
      if (user.snapshot.val() == null)
        api.actions.creation.user(new CreateUserPayload(uid, action.payload.displayName));
      else
        api.actions.users.setCurrent(uid);
    };

_onSetCurrentUser(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      next(action);
      _subToUser(api, subMgr, refs, action.payload);
    };

/// subscribe to the current user's boards
_onUpdateUser(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<User> action,
    ) {
      next(action);
      if (action.payload.uid == api.state.users.currentUid)
        _subToBoards(api, subMgr, refs, api.state.users.current.boardUids.keys);
    };

_onSetCurrentBoard(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      // TODO: unsub from old board

      next(action);
      _subToSessions(api, subMgr, refs, action.payload);
      _subToUsers(api, subMgr, refs, api.state.boards.current.memberUids.keys);
    };

_onSetCurrentSession(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) {
      // TODO: unsub from old session

      next(action);
      var currentSession = api.state.sessions.current;
      var boardUid = currentSession.boardUid;
      var sessionUid = currentSession.uid;
      _subToItems(api, subMgr, refs, boardUid, sessionUid);
      _subToCategories(api, subMgr, refs, boardUid);
      _subToNotes(api, subMgr, refs, boardUid, sessionUid);
    };

////////////////////
/// Util
///////////////////

_subToUser(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  String userUid,
) {
  subMgr.add<User>(
    refs.user(userUid),
    api.actions.users.update,
    User.serializer,
  );
}

_subToBoards(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  Iterable<String> boardUids,
) {
  boardUids.forEach((uid) => subMgr.add<Board>(
        refs.board(uid),
        api.actions.boards.update,
        Board.serializer,
      ));
}

_subToUsers(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  Iterable<String> userUids,
) {
  userUids.forEach((uid) => subMgr.add<User>(
        refs.user(uid),
        api.actions.users.update,
        User.serializer,
      ));
}

_subToSessions(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  String boardUid,
) {
  subMgr.addList<Session>(
    refs.sessions(boardUid),
    Session.serializer,
    onChildAdded: api.actions.sessions.update,
    onChildRemoved: api.actions.sessions.remove,
    onChildChanged: api.actions.sessions.update,
  );
}

_subToItems(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  String boardUid,
  String sessionUid,
) {
  subMgr.addList<Item>(
    refs.items(boardUid, sessionUid),
    Item.serializer,
    onChildAdded: api.actions.items.update,
    onChildRemoved: api.actions.items.remove,
    onChildChanged: api.actions.items.update,
  );
}

_subToCategories(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  String boardUid,
) {
  subMgr.addList<Category>(
    refs.categories(boardUid),
    Category.serializer,
    onChildAdded: api.actions.categories.update,
    onChildRemoved: api.actions.categories.remove,
    onChildChanged: api.actions.categories.update,
  );
}

_subToNotes(
  MiddlewareApi<App, AppBuilder, AppActions> api,
  StreamSubManager subMgr,
  Refs refs,
  String boardUid,
  String sessionUid,
) {
  subMgr.addList<Note>(
    refs.notes(boardUid, sessionUid),
    Note.serializer,
    onChildAdded: api.actions.notes.update,
    onChildRemoved: api.actions.notes.remove,
    onChildChanged: api.actions.notes.update,
  );
}
