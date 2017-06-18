library refMiddleware;

import 'package:built_redux/built_redux.dart';

import '../state/app.dart';
import '../streamSubManager.dart';
import '../refs.dart';
import '../models/user.dart';
import '../models/board.dart';
import '../models/session.dart';
import '../models/category.dart';
import '../models/item.dart';
import '../models/note.dart';

part 'refMiddleware.g.dart';

////////////////////
/// Actions
///////////////////

// Actions to be handled by this middleware
abstract class RefMiddlewareActions extends ReduxActions {
  ActionDispatcher<Iterable<SubPayload>> updateUserSubs;
  ActionDispatcher<SubPayload> subToUser;

  ActionDispatcher<User> subToUserBoards;
  ActionDispatcher<Board> subToBoardSessions;
  ActionDispatcher<Board> subToBoardCategories;
  ActionDispatcher<Session> subToSessionItems;
  ActionDispatcher<Session> subToSessionNotes;

  ActionDispatcher<Iterable<SubPayload>> updateBoardSubs;
  // ActionDispatcher<SubPayload> subToBoard;
  // ActionDispatcher<Iterable<SubPayload>> updateSessionSubs;
  // ActionDispatcher<SubPayload> subToSession;
  // ActionDispatcher<Iterable<SubPayload>> updateCategorySubs;
  // ActionDispatcher<SubPayload> subToCategory;
  // ActionDispatcher<Iterable<SubPayload>> updateItemSubs;
  // ActionDispatcher<SubPayload> subToItem;
  // ActionDispatcher<Iterable<SubPayload>> updateNoteSubs;
  // ActionDispatcher<SubPayload> subToNote;

  // ActionDispatcher<SubPayload> unSubToUID;

  RefMiddlewareActions._();
  factory RefMiddlewareActions() => new _$RefMiddlewareActions();
}

////////////////////
/// Action Map
///////////////////

createRefMiddleware(StreamSubManager subMgr, Refs refs) =>
    (new MiddlwareBuilder<App, AppBuilder, AppActions>()
      ..add<Iterable<SubPayload>>(RefMiddlewareActionsNames.updateUserSubs, _updateUserSubs(subMgr, refs))
      ..add<SubPayload>(RefMiddlewareActionsNames.subToUser, _subToUser(subMgr, refs))

      ..add<User>(RefMiddlewareActionsNames.subToUserBoards, _subToUserBoards(subMgr, refs))
      ..add<Board>(RefMiddlewareActionsNames.subToBoardSessions, _subToBoardSessions(subMgr, refs))
      ..add<Board>(RefMiddlewareActionsNames.subToBoardCategories, _subToBoardCategories(subMgr, refs))
      ..add<Session>(RefMiddlewareActionsNames.subToSessionItems, _subToSessionItems(subMgr, refs))
      ..add<Session>(RefMiddlewareActionsNames.subToSessionNotes, _subToSessionNotes(subMgr, refs))


      ..add<Iterable<SubPayload>>(RefMiddlewareActionsNames.updateBoardSubs, _updateBoardSubs(subMgr, refs))
      // ..add<SubPayload>(RefMiddlewareActionsNames.subToBoard, _subToBoard(subMgr, refs))
      // ..add<Iterable<SubPayload>>(RefMiddlewareActionsNames.updateSessionSubs, _updateSessionSubs(subMgr, refs))
      // ..add<SubPayload>(RefMiddlewareActionsNames.subToSession, _subToSession(subMgr, refs))
      // ..add<Iterable<SubPayload>>(RefMiddlewareActionsNames.updateCategorySubs, _updateCategorySubs(subMgr, refs))
      // ..add<SubPayload>(RefMiddlewareActionsNames.subToCategory, _subToCategory(subMgr, refs))
      // ..add<Iterable<SubPayload>>(RefMiddlewareActionsNames.updateItemSubs, _updateItemSubs(subMgr, refs))
      // ..add<SubPayload>(RefMiddlewareActionsNames.subToItem, _subToItem(subMgr, refs))
      // ..add<Iterable<SubPayload>>(RefMiddlewareActionsNames.updateNoteSubs, _updateNoteSubs(subMgr, refs))
      // ..add<SubPayload>(RefMiddlewareActionsNames.subToNote, _subToNote(subMgr, refs))
    ).build();

////////////////////
/// Payloads
///////////////////

class SubPayload {
  final String boardUid;
  final String sessionUid;
  final String uid;
  SubPayload(this.uid, {this.boardUid, this.sessionUid});
}

////////////////////
/// Handlers
///////////////////

_updateUserSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<SubPayload>> action,
    ) => action.payload.forEach((SubPayload p) => subMgr.add<User>(
      refs.user(p.uid),
      api.actions.users.update,
      User.serializer,
    ));

_subToUser(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<SubPayload> action,
    ) =>
        subMgr.add<User>(
          refs.user(action.payload.uid),
          api.actions.users.update,
          User.serializer,
        );

_subToUserBoards(StreamSubManager subMgr, Refs refs) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<User> action,
  ) {
    action.payload.boardUids.keys.forEach((boardUid) => subMgr.add<Board>(
          refs.board(boardUid),
          api.actions.boards.update,
          Board.serializer,
        ));
  };

_subToBoardSessions(StreamSubManager subMgr, Refs refs) => (
    MiddlewareApi<App, AppBuilder, AppActions> api,
    ActionHandler next,
    Action<Board> action,
  ) {
    // TODO: this might not work. since sessions sub is to the map of all
    // board sessions. So add change remove event listeners might be required
    // instead of the one update.
    subMgr.add<Session>(
      refs.sessions(action.payload.uid),
      api.actions.sessions.update,
      Session.serializer,
    );
  };



_updateBoardSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<SubPayload>> action,
    ) =>
        action.payload.forEach((SubPayload p) => subMgr.add<Board>(
              refs.board(p.uid),
              api.actions.boards.update,
              Board.serializer,
            ));

_subToBoard(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<SubPayload> action,
    ) =>
        subMgr.add<Board>(
          refs.board(action.payload.uid),
          api.actions.boards.update,
          Board.serializer,
        );

_updateSessionSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<SubPayload>> action,
    ) =>
        action.payload.forEach((SubPayload p) => subMgr.add<Session>(
              refs.session(p.boardUid, p.uid),
              api.actions.sessions.update,
              Session.serializer,
            ));

_subToSession(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<SubPayload> action,
    ) =>
        subMgr.add<Session>(
          refs.session(action.payload.boardUid, action.payload.uid),
          api.actions.sessions.update,
          Session.serializer,
        );

_updateCategorySubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<SubPayload>> action,
    ) =>
        action.payload.forEach((SubPayload p) => subMgr.add<Category>(
              refs.category(p.boardUid, p.uid),
              api.actions.categories.update,
              Category.serializer,
            ));

_subToCategory(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<SubPayload> action,
    ) =>
        subMgr.add<Category>(
          refs.category(action.payload.boardUid, action.payload.uid),
          api.actions.categories.update,
          Category.serializer,
        );

_updateItemSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<SubPayload>> action,
    ) =>
        action.payload.forEach((SubPayload p) => subMgr.add<Item>(
              refs.item(p.boardUid, p.sessionUid, p.uid),
              api.actions.items.update,
              Item.serializer,
            ));

_subToItem(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<SubPayload> action,
    ) =>
        subMgr.add<Item>(
          refs.item(action.payload.boardUid, action.payload.sessionUid, action.payload.uid),
          api.actions.items.update,
          Item.serializer,
        );

_updateNoteSubs(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<Iterable<SubPayload>> action,
    ) =>
        action.payload.forEach((SubPayload p) => subMgr.add<Note>(
              refs.note(p.boardUid, p.sessionUid, p.uid),
              api.actions.notes.update,
              Note.serializer,
            ));

_subToNote(StreamSubManager subMgr, Refs refs) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<SubPayload> action,
    ) =>
        subMgr.add<Note>(
          refs.note(action.payload.boardUid, action.payload.sessionUid, action.payload.uid),
          api.actions.notes.update,
          Note.serializer,
        );
