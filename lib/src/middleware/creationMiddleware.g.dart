// GENERATED CODE - DO NOT MODIFY BY HAND

part of creationMiddleware;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class CreationMiddlewareActions
// **************************************************************************

class _$CreationMiddlewareActions extends CreationMiddlewareActions {
  ActionDispatcher<CreateNotePayload> note =
      new ActionDispatcher<CreateNotePayload>('CreationMiddlewareActions-note');

  ActionDispatcher<CreateItemPayload> item =
      new ActionDispatcher<CreateItemPayload>('CreationMiddlewareActions-item');

  ActionDispatcher<CreateCategoryPayload> category =
      new ActionDispatcher<CreateCategoryPayload>(
          'CreationMiddlewareActions-category');

  ActionDispatcher<CreateSessionPayload> session =
      new ActionDispatcher<CreateSessionPayload>(
          'CreationMiddlewareActions-session');

  ActionDispatcher<CreateBoardPayload> board =
      new ActionDispatcher<CreateBoardPayload>(
          'CreationMiddlewareActions-board');
  factory _$CreationMiddlewareActions() => new _$CreationMiddlewareActions._();
  _$CreationMiddlewareActions._() : super._();
  syncWithStore(dispatcher) {
    note.syncWithStore(dispatcher);
    item.syncWithStore(dispatcher);
    category.syncWithStore(dispatcher);
    session.syncWithStore(dispatcher);
    board.syncWithStore(dispatcher);
  }
}

class CreationMiddlewareActionsNames {
  static ActionName note =
      new ActionName<CreateNotePayload>('CreationMiddlewareActions-note');
  static ActionName item =
      new ActionName<CreateItemPayload>('CreationMiddlewareActions-item');
  static ActionName category = new ActionName<CreateCategoryPayload>(
      'CreationMiddlewareActions-category');
  static ActionName session =
      new ActionName<CreateSessionPayload>('CreationMiddlewareActions-session');
  static ActionName board =
      new ActionName<CreateBoardPayload>('CreationMiddlewareActions-board');
}
