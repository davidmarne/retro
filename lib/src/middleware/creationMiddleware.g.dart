// GENERATED CODE - DO NOT MODIFY BY HAND

part of creationMiddleware;

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$CreationMiddlewareActions extends CreationMiddlewareActions {
  factory _$CreationMiddlewareActions() => new _$CreationMiddlewareActions._();
  _$CreationMiddlewareActions._() : super._();

  final ActionDispatcher<CreateBoardPayload> board =
      new ActionDispatcher<CreateBoardPayload>(
          'CreationMiddlewareActions-board');
  final ActionDispatcher<CreateSessionPayload> session =
      new ActionDispatcher<CreateSessionPayload>(
          'CreationMiddlewareActions-session');
  final ActionDispatcher<Null> cloneSession =
      new ActionDispatcher<Null>('CreationMiddlewareActions-cloneSession');
  final ActionDispatcher<CreateCategoryPayload> category =
      new ActionDispatcher<CreateCategoryPayload>(
          'CreationMiddlewareActions-category');
  final ActionDispatcher<CreateItemPayload> item =
      new ActionDispatcher<CreateItemPayload>('CreationMiddlewareActions-item');
  final ActionDispatcher<String> note =
      new ActionDispatcher<String>('CreationMiddlewareActions-note');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    board.setDispatcher(dispatcher);
    session.setDispatcher(dispatcher);
    cloneSession.setDispatcher(dispatcher);
    category.setDispatcher(dispatcher);
    item.setDispatcher(dispatcher);
    note.setDispatcher(dispatcher);
  }
}

class CreationMiddlewareActionsNames {
  static final ActionName<CreateBoardPayload> board =
      new ActionName<CreateBoardPayload>('CreationMiddlewareActions-board');
  static final ActionName<CreateSessionPayload> session =
      new ActionName<CreateSessionPayload>('CreationMiddlewareActions-session');
  static final ActionName<Null> cloneSession =
      new ActionName<Null>('CreationMiddlewareActions-cloneSession');
  static final ActionName<CreateCategoryPayload> category =
      new ActionName<CreateCategoryPayload>(
          'CreationMiddlewareActions-category');
  static final ActionName<CreateItemPayload> item =
      new ActionName<CreateItemPayload>('CreationMiddlewareActions-item');
  static final ActionName<String> note =
      new ActionName<String>('CreationMiddlewareActions-note');
}
