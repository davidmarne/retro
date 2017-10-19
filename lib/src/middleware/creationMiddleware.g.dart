// GENERATED CODE - DO NOT MODIFY BY HAND

part of creationMiddleware;

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$CreationMiddlewareActions extends CreationMiddlewareActions {
  final ActionDispatcher<String> note =
      new ActionDispatcher<String>('CreationMiddlewareActions-note');

  final ActionDispatcher<CreateItemPayload> item =
      new ActionDispatcher<CreateItemPayload>('CreationMiddlewareActions-item');

  final ActionDispatcher<CreateCategoryPayload> category =
      new ActionDispatcher<CreateCategoryPayload>(
          'CreationMiddlewareActions-category');

  final ActionDispatcher<Null> cloneSession =
      new ActionDispatcher<Null>('CreationMiddlewareActions-cloneSession');

  final ActionDispatcher<CreateSessionPayload> session =
      new ActionDispatcher<CreateSessionPayload>(
          'CreationMiddlewareActions-session');

  final ActionDispatcher<CreateBoardPayload> board =
      new ActionDispatcher<CreateBoardPayload>(
          'CreationMiddlewareActions-board');
  factory _$CreationMiddlewareActions() => new _$CreationMiddlewareActions._();

  _$CreationMiddlewareActions._() : super._();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    note.setDispatcher(dispatcher);
    item.setDispatcher(dispatcher);
    category.setDispatcher(dispatcher);
    cloneSession.setDispatcher(dispatcher);
    session.setDispatcher(dispatcher);
    board.setDispatcher(dispatcher);
  }
}

class CreationMiddlewareActionsNames {
  static final ActionName<String> note =
      new ActionName<String>('CreationMiddlewareActions-note');
  static final ActionName<CreateItemPayload> item =
      new ActionName<CreateItemPayload>('CreationMiddlewareActions-item');
  static final ActionName<CreateCategoryPayload> category =
      new ActionName<CreateCategoryPayload>(
          'CreationMiddlewareActions-category');
  static final ActionName<Null> cloneSession =
      new ActionName<Null>('CreationMiddlewareActions-cloneSession');
  static final ActionName<CreateSessionPayload> session =
      new ActionName<CreateSessionPayload>('CreationMiddlewareActions-session');
  static final ActionName<CreateBoardPayload> board =
      new ActionName<CreateBoardPayload>('CreationMiddlewareActions-board');
}
