import 'package:built_redux/built_redux.dart';

import '../state/app.dart';
import '../state/users.dart';
import '../state/boards.dart';
import '../state/sessions.dart';
import '../state/categories.dart';
import '../state/items.dart';

import '../firebaseClient.dart';

import '../models/user.dart';
import '../models/board.dart';
import '../models/session.dart';
import '../models/item.dart';

////////////////////
/// Action Map
///////////////////

createRefMiddleware(FirebaseClient client) => (new MiddlewareBuilder<App, AppBuilder, AppActions>()
      ..add<String>(CategoriesActionsNames.hide, _hideCategory(client))
      ..add<String>(CategoriesActionsNames.show, _showCategory(client))

      ..add<String>(ItemsActionsNames.editText, _editItemText(client))
      ..add<String>(ItemsActionsNames.addSupport, _addSupport(client))
      ..add<String>(ItemsActionsNames.removeSupport, _removeSupport(client))
      ..add<String>(ItemsActionsNames.hide, _hideItem(client))
      ..add<String>(ItemsActionsNames.show, _showItem(client))

      ..add<Null>(SessionsActionsNames.start, _startSession(client))
      ..add<Null>(SessionsActionsNames.end, _endSession(client))
      ..add<Null>(SessionsActionsNames.reset, _resetSession(client))
      ..add<String>(SessionsActionsNames.present, _present(client))
      ..add<Null>(SessionsActionsNames.shred, _shredSession(client))
      ..add<User>(UsersActionsNames.update, _onUpdateUser(client))
      ..add<String>(UsersActionsNames.setCurrent, _onSetCurrentUser(client))

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

// Shared functionality

_updateCurrentUserSubs(FirebaseClient client, MiddlewareApi<App, AppBuilder, AppActions> api) {
  var user = api.state.users.current;
  if (user != null) {
    client.subToUser(user.uid);
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

// Update Ref Properties

_addSupport(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var userUid = api.state.users.currentUid;
    Item item = api.state.items.map[action.payload];
    if (item != null && userUid != "") {
      client.addSupport(userUid, item);
    }
  };

_editItemText(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    Item item = api.state.items.current;
    if (item != null) {
      client.editItemText(action.payload, item);
    }
  };

_removeSupport(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var userUid = api.state.users.currentUid;
    Item item = api.state.items.map[action.payload];
    if (item != null && userUid != "") {
      client.removeSupport(userUid, item);
    }
  };

_hideCategory(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var category = api.state.categories.map[action.payload];
    if (category != null) {
      client.hideCategory(category);
    }
  };

_showCategory(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var category = api.state.categories.map[action.payload];
    if (category != null) {
      client.showCategory(category);
    }
  };

_hideItem(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var item = api.state.items.map[action.payload];
    if (item != null) {
      client.hideItem(item);
    }
  };

_showItem(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var item = api.state.items.map[action.payload];
    if (item != null) {
      client.showItem(item);
    }
  };

_startSession(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<Null> action) {
    next(action);
    var epoch = now();
    Session session = api.state.sessions.current;
    if (session != null) {
      client.startSession(session, epoch);
    }
  };

_endSession(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<Null> action) {
    next(action);
    var epoch = now();
    Session session = api.state.sessions.current;
    if (session != null) {
      client.endSession(session, epoch);
    }
  };

_resetSession(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    Session session = api.state.sessions.current;
    var items = api.state.sessionItems;
    if (session != null) {
      client.resetSession(session, items);
    }
  };

_shredSession(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    Session session = api.state.sessions.current;
    if (session != null) {
      Board board = api.state.boards.map[session.boardUid];
      if (board != null && board.latestSessionUid == session.uid) {
        client.clearBoardsLatestSession(board.uid);
      }
      client.shredSession(session, board);
    }
  };

_present(FirebaseClient client) => (
  MiddlewareApi<App, AppBuilder, AppActions> api,
  ActionHandler next,
  Action<String> action) {
    next(action);
    var epoch = now();
    Session session = api.state.sessions.current;
    if (session != null) {
      String oldItemUid = api.state.sessions.current.presentedUid;
      if (action.payload != oldItemUid) {
        if (oldItemUid != "") {
          int oldItemStartTime = api.state.sessions.current.presentedDate;
          Item oldItem = api.state.items.map[oldItemUid];
          if (oldItem != null) {
            client.updateItemTime(oldItem, epoch - oldItemStartTime);
          }
        }
      }
      // present new item
      if (action.payload != "") {
        Item newItem = api.state.items.map[action.payload];
        if (newItem != null) {
          client.present(newItem, epoch);
        }
      }
    }
  };
