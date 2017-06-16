library refMiddleware;

import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:built_value/serializer.dart';
import 'package:firebase/firebase.dart' as firebase;

import '../state/app.dart';
import '../state/boards.dart';
import '../models/board.dart';
import '../models/user.dart';
import '../serializers.dart';

part 'refMiddleware.g.dart';

createRefMiddleware(StreamSubManager subMgr) => (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<BoardPayload>(RefMiddlewareActionsNames.subToBoard, _subToBoard(subMgr))
      ..add<String>(RefMiddlewareActionsNames.subToGroup, _subToGroup(subMgr))
      ..add<String>(RefMiddlewareActionsNames.updateGroupSubs, _updateGroupSubs(subMgr))
      ..add<String>(RefMiddlewareActionsNames.subToUser, _subToUser(subMgr))
      ..add<String>(RefMiddlewareActionsNames.updateUserSubs, _updateUserSubs(subMgr))
      ..add<Iterable<BoardPayload>>(RefMiddlewareActionsNames.updateBoardSubs, _updateBoardSubs(subMgr))
      ..add<String>(RefMiddlewareActionsNames.unSubToUID, _unSubToUID(subMgr)))
    .build();

// Actions to be handled by this middleware
abstract class RefMiddlewareActions extends ReduxActions {
  ActionDispatcher<String> subToGroup;
  ActionDispatcher<Iterable<String>> updateGroupSubs;
  ActionDispatcher<Iterable<String>> updateUserSubs;
  ActionDispatcher<Iterable<BoardPayload>> updateBoardSubs;
  ActionDispatcher<String> subToUser;
  ActionDispatcher<BoardPayload> subToBoard;
  ActionDispatcher<String> unSubToUID;

  RefMiddlewareActions._();
  factory RefMiddlewareActions() => new _$RefMiddlewareActions();
}

_updateGroupSubs(StreamSubManager subMgr) => (MiddlewareApi<App, AppBuilder, AppActions> api,
        ActionHandler next, Action<Iterable<String>> action) =>
    action.payload.forEach((String uid) => subMgr.add<Group>(
          'groups/',
          uid,
          api.actions.groups.updateGroup,
          Group.serializer,
        ));

_updateUserSubs(StreamSubManager subMgr) => (MiddlewareApi<App, AppBuilder, AppActions> api,
        ActionHandler next, Action<Iterable<String>> action) =>
    action.payload.forEach((String uid) => subMgr.add<User>(
          'users/',
          uid,
          api.actions.users.updateUser,
          User.serializer,
        ));

_updateBoardSubs(StreamSubManager subMgr) => (MiddlewareApi<App, AppBuilder, AppActions> api,
        ActionHandler next, Action<Iterable<BoardPayload>> action) =>
    action.payload.forEach((BoardPayload p) => subMgr.add<Board>(
          'boards/${p.guid}/',
          p.buid,
          api.actions.boards.updateBoard,
          Board.serializer,
        ));

_subToGroup(StreamSubManager subMgr) =>
    (MiddlewareApi<App, AppBuilder, AppActions> api, ActionHandler next, Action<String> action) =>
        subMgr.add<Group>(
          'groups/',
          action.payload,
          api.actions.groups.updateGroup,
          Group.serializer,
        );

_subToBoard(StreamSubManager subMgr) => (MiddlewareApi<App, AppBuilder, AppActions> api,
        ActionHandler next, Action<BoardPayload> action) =>
    subMgr.add<Board>(
      'boards/${action.payload.guid}/',
      action.payload.buid,
      api.actions.boards.updateBoard,
      Board.serializer,
    );

_subToUser(StreamSubManager subMgr) =>
    (MiddlewareApi<App, AppBuilder, AppActions> api, ActionHandler next, Action<String> action) =>
        subMgr.add<User>(
          'users/',
          action.payload,
          api.actions.users.updateUser,
          User.serializer,
        );

_unSubToUID(StreamSubManager subMgr) =>
    (MiddlewareApi<App, AppBuilder, AppActions> api, ActionHandler next, Action<String> action) =>
        subMgr.cancel(action.payload);

/// [StreamSubManager]
class StreamSubManager {
  final Map<String, StreamSubscription<firebase.QueryEvent>> _refs;
  final firebase.Database db;

  StreamSubManager(this.db) : _refs = new Map<String, StreamSubscription<firebase.QueryEvent>>();

  void cancel(String uid) {
    _refs[uid].cancel();
    _refs.remove(uid);
  }

  void add<T>(
      String path, String uid, ActionDispatcher<T> actionDispatcher, Serializer<T> serializer) {
    // if we are already subbed bail
    if (_refs[uid] != null) return;

    // sub to the ref
    _refs[uid] = db.ref('$path/$uid').onValue.listen((firebase.QueryEvent event) {
      if (event.snapshot.val() == null) {
        print("WTF value was null");
        print(actionDispatcher.name);
        return;
      }
      actionDispatcher(
        serializers.deserializeWith(serializer, event.snapshot.val()),
      );
    });
  }
}
