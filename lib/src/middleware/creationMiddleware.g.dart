// GENERATED CODE - DO NOT MODIFY BY HAND

part of creationMiddleware;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class CreationMiddlewareActions
// **************************************************************************

class _$CreationMiddlewareActions extends CreationMiddlewareActions {
  ActionDispatcher<CreateItemPayload> item =
      new ActionDispatcher<CreateItemPayload>('CreationMiddlewareActions-item');

  ActionDispatcher<CreateCategoryPayload> category =
      new ActionDispatcher<CreateCategoryPayload>(
          'CreationMiddlewareActions-category');

  ActionDispatcher<CreateUserPayload> user =
      new ActionDispatcher<CreateUserPayload>('CreationMiddlewareActions-user');

  ActionDispatcher<CreateBoardPayload> board =
      new ActionDispatcher<CreateBoardPayload>(
          'CreationMiddlewareActions-board');

  ActionDispatcher<CreateGroupPayload> group =
      new ActionDispatcher<CreateGroupPayload>(
          'CreationMiddlewareActions-group');
  factory _$CreationMiddlewareActions() => new _$CreationMiddlewareActions._();
  _$CreationMiddlewareActions._() : super._();
  syncWithStore(dispatcher) {
    item.syncWithStore(dispatcher);
    category.syncWithStore(dispatcher);
    user.syncWithStore(dispatcher);
    board.syncWithStore(dispatcher);
    group.syncWithStore(dispatcher);
  }
}

class CreationMiddlewareActionsNames {
  static ActionName item =
      new ActionName<CreateItemPayload>('CreationMiddlewareActions-item');
  static ActionName category = new ActionName<CreateCategoryPayload>(
      'CreationMiddlewareActions-category');
  static ActionName user =
      new ActionName<CreateUserPayload>('CreationMiddlewareActions-user');
  static ActionName board =
      new ActionName<CreateBoardPayload>('CreationMiddlewareActions-board');
  static ActionName group =
      new ActionName<CreateGroupPayload>('CreationMiddlewareActions-group');
}
