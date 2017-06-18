// GENERATED CODE - DO NOT MODIFY BY HAND

part of refMiddleware;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class RefMiddlewareActions
// **************************************************************************

class _$RefMiddlewareActions extends RefMiddlewareActions {
  ActionDispatcher<SubPayload> unSubToUID =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-unSubToUID');

  ActionDispatcher<SubPayload> subToNote =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-subToNote');

  ActionDispatcher<Iterable<SubPayload>> updateNoteSubs =
      new ActionDispatcher<Iterable<SubPayload>>(
          'RefMiddlewareActions-updateNoteSubs');

  ActionDispatcher<SubPayload> subToItem =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-subToItem');

  ActionDispatcher<Iterable<SubPayload>> updateItemSubs =
      new ActionDispatcher<Iterable<SubPayload>>(
          'RefMiddlewareActions-updateItemSubs');

  ActionDispatcher<SubPayload> subToCategory =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-subToCategory');

  ActionDispatcher<Iterable<SubPayload>> updateCategorySubs =
      new ActionDispatcher<Iterable<SubPayload>>(
          'RefMiddlewareActions-updateCategorySubs');

  ActionDispatcher<SubPayload> subToSession =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-subToSession');

  ActionDispatcher<Iterable<SubPayload>> updateSessionSubs =
      new ActionDispatcher<Iterable<SubPayload>>(
          'RefMiddlewareActions-updateSessionSubs');

  ActionDispatcher<SubPayload> subToBoard =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-subToBoard');

  ActionDispatcher<Iterable<SubPayload>> updateBoardSubs =
      new ActionDispatcher<Iterable<SubPayload>>(
          'RefMiddlewareActions-updateBoardSubs');

  ActionDispatcher<SubPayload> subToUser =
      new ActionDispatcher<SubPayload>('RefMiddlewareActions-subToUser');

  ActionDispatcher<Iterable<SubPayload>> updateUserSubs =
      new ActionDispatcher<Iterable<SubPayload>>(
          'RefMiddlewareActions-updateUserSubs');
  factory _$RefMiddlewareActions() => new _$RefMiddlewareActions._();
  _$RefMiddlewareActions._() : super._();
  syncWithStore(dispatcher) {
    unSubToUID.syncWithStore(dispatcher);
    subToNote.syncWithStore(dispatcher);
    updateNoteSubs.syncWithStore(dispatcher);
    subToItem.syncWithStore(dispatcher);
    updateItemSubs.syncWithStore(dispatcher);
    subToCategory.syncWithStore(dispatcher);
    updateCategorySubs.syncWithStore(dispatcher);
    subToSession.syncWithStore(dispatcher);
    updateSessionSubs.syncWithStore(dispatcher);
    subToBoard.syncWithStore(dispatcher);
    updateBoardSubs.syncWithStore(dispatcher);
    subToUser.syncWithStore(dispatcher);
    updateUserSubs.syncWithStore(dispatcher);
  }
}

class RefMiddlewareActionsNames {
  static ActionName unSubToUID =
      new ActionName<SubPayload>('RefMiddlewareActions-unSubToUID');
  static ActionName subToNote =
      new ActionName<SubPayload>('RefMiddlewareActions-subToNote');
  static ActionName updateNoteSubs = new ActionName<Iterable<SubPayload>>(
      'RefMiddlewareActions-updateNoteSubs');
  static ActionName subToItem =
      new ActionName<SubPayload>('RefMiddlewareActions-subToItem');
  static ActionName updateItemSubs = new ActionName<Iterable<SubPayload>>(
      'RefMiddlewareActions-updateItemSubs');
  static ActionName subToCategory =
      new ActionName<SubPayload>('RefMiddlewareActions-subToCategory');
  static ActionName updateCategorySubs = new ActionName<Iterable<SubPayload>>(
      'RefMiddlewareActions-updateCategorySubs');
  static ActionName subToSession =
      new ActionName<SubPayload>('RefMiddlewareActions-subToSession');
  static ActionName updateSessionSubs = new ActionName<Iterable<SubPayload>>(
      'RefMiddlewareActions-updateSessionSubs');
  static ActionName subToBoard =
      new ActionName<SubPayload>('RefMiddlewareActions-subToBoard');
  static ActionName updateBoardSubs = new ActionName<Iterable<SubPayload>>(
      'RefMiddlewareActions-updateBoardSubs');
  static ActionName subToUser =
      new ActionName<SubPayload>('RefMiddlewareActions-subToUser');
  static ActionName updateUserSubs = new ActionName<Iterable<SubPayload>>(
      'RefMiddlewareActions-updateUserSubs');
}
