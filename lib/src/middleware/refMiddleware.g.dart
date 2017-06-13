// GENERATED CODE - DO NOT MODIFY BY HAND

part of refMiddleware;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class RefMiddlewareActions
// **************************************************************************

class _$RefMiddlewareActions extends RefMiddlewareActions {
  ActionDispatcher<String> unSubToUID =
      new ActionDispatcher<String>('RefMiddlewareActions-unSubToUID');

  ActionDispatcher<UpdateBoardSubsPayload> subToBoard =
      new ActionDispatcher<UpdateBoardSubsPayload>(
          'RefMiddlewareActions-subToBoard');

  ActionDispatcher<String> subToUser =
      new ActionDispatcher<String>('RefMiddlewareActions-subToUser');

  ActionDispatcher<Iterable<UpdateBoardSubsPayload>> updateBoardSubs =
      new ActionDispatcher<Iterable<UpdateBoardSubsPayload>>(
          'RefMiddlewareActions-updateBoardSubs');

  ActionDispatcher<Iterable<String>> updateUserSubs =
      new ActionDispatcher<Iterable<String>>(
          'RefMiddlewareActions-updateUserSubs');

  ActionDispatcher<Iterable<String>> updateGroupSubs =
      new ActionDispatcher<Iterable<String>>(
          'RefMiddlewareActions-updateGroupSubs');

  ActionDispatcher<String> subToGroup =
      new ActionDispatcher<String>('RefMiddlewareActions-subToGroup');
  factory _$RefMiddlewareActions() => new _$RefMiddlewareActions._();
  _$RefMiddlewareActions._() : super._();
  syncWithStore(dispatcher) {
    unSubToUID.syncWithStore(dispatcher);
    subToBoard.syncWithStore(dispatcher);
    subToUser.syncWithStore(dispatcher);
    updateBoardSubs.syncWithStore(dispatcher);
    updateUserSubs.syncWithStore(dispatcher);
    updateGroupSubs.syncWithStore(dispatcher);
    subToGroup.syncWithStore(dispatcher);
  }
}

class RefMiddlewareActionsNames {
  static ActionName unSubToUID =
      new ActionName<String>('RefMiddlewareActions-unSubToUID');
  static ActionName subToBoard =
      new ActionName<UpdateBoardSubsPayload>('RefMiddlewareActions-subToBoard');
  static ActionName subToUser =
      new ActionName<String>('RefMiddlewareActions-subToUser');
  static ActionName updateBoardSubs =
      new ActionName<Iterable<UpdateBoardSubsPayload>>(
          'RefMiddlewareActions-updateBoardSubs');
  static ActionName updateUserSubs =
      new ActionName<Iterable<String>>('RefMiddlewareActions-updateUserSubs');
  static ActionName updateGroupSubs =
      new ActionName<Iterable<String>>('RefMiddlewareActions-updateGroupSubs');
  static ActionName subToGroup =
      new ActionName<String>('RefMiddlewareActions-subToGroup');
}
