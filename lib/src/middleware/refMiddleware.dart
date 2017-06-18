library refMiddleware;

import 'package:built_redux/built_redux.dart';

import '../state/app.dart';
import '../streamSubManager.dart';
import '../refs.dart';
import '../models/board.dart';
import '../models/user.dart';

part 'refMiddleware.g.dart';

////////////////////
/// Actions
///////////////////

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

////////////////////
/// Payloads
///////////////////

class UpdateBoardSubsPayload {
  final String guid;
  final String uid;
  UpdateBoardSubsPayload(this.guid, this.uid);
}

////////////////////
/// Action Map
///////////////////

createRefMiddleware(StreamSubManager subMgr, Refs refs) =>
    (new MiddlwareBuilder<App, AppBuilder, AppActions>()
          ..add<String>(RefMiddlewareActionsNames.subToBoard, _subToBoard(subMgr, refs))
          ..add<String>(RefMiddlewareActionsNames.subToGroup, _subToGroup(subMgr, refs))
          ..add<String>(RefMiddlewareActionsNames.updateGroupSubs, _updateGroupSubs(subMgr, refs))
          ..add<String>(RefMiddlewareActionsNames.subToUser, _subToUser(subMgr, refs))
          ..add<String>(RefMiddlewareActionsNames.updateUserSubs, _updateUserSubs(subMgr, refs))
          ..add<String>(RefMiddlewareActionsNames.updateBoardSubs, _updateBoardSubs(subMgr, refs)))
        .build();

////////////////////
/// Handlers
///////////////////

_updateGroupSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<String>> action,
    ) =>
        action.payload.forEach((String uid) => subMgr.add<Group>(
              refs.group(uid),
              api.actions.groups.updateGroup,
              Group.serializer,
            ));

_updateUserSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<String>> action,
    ) =>
        action.payload.forEach((String uid) => subMgr.add<User>(
              refs.user(uid),
              api.actions.users.updateUser,
              User.serializer,
            ));
_updateBoardSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<UpdateBoardSubsPayload>> action,
    ) =>
        action.payload.forEach((UpdateBoardSubsPayload p) => subMgr.add<Board>(
              refs.board(p.guid, p.uid),
              api.actions.boards.updateBoard,
              Board.serializer,
            ));

_subToGroup(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) =>
        subMgr.add<Group>(
          refs.group(action.payload),
          api.actions.groups.updateGroup,
          Group.serializer,
        );

_subToBoard(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<UpdateBoardSubsPayload> action,
    ) =>
        subMgr.add<Board>(
          refs.board(action.payload.guid, action.payload.uid),
          api.actions.boards.updateBoard,
          Board.serializer,
        );

_subToUser(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) =>
        subMgr.add<User>(
          refs.user(action.payload),
          api.actions.users.updateUser,
          User.serializer,
        );
