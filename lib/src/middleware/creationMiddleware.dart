library creationMiddleware;

import 'package:built_redux/built_redux.dart';

import '../firebaseClient.dart';
import '../state/app.dart';
import '../models/dateIntervalKinds.dart';

part 'creationMiddleware.g.dart';

////////////////////
/// Actions
///////////////////

// Actions to be handled by this middleware
abstract class CreationMiddlewareActions extends ReduxActions {
  ActionDispatcher<CreateBoardPayload> board;
  ActionDispatcher<CreateSessionPayload> session;
  ActionDispatcher<CreateCategoryPayload> category;
  ActionDispatcher<CreateItemPayload> item;
  ActionDispatcher<CreateNotePayload> note;

  CreationMiddlewareActions._();
  factory CreationMiddlewareActions() => new _$CreationMiddlewareActions();
}

////////////////////
/// Payloads
///////////////////

class CreateBoardPayload {
  final String title;
  final String description;
  final int interval;
  final DateIntervalKinds intervalKind;
  CreateBoardPayload(this.title, this.description, this.interval, this.intervalKind);
}

class CreateSessionPayload {
  final int targetTime;
  CreateSessionPayload(this.targetTime);
}

class CreateCategoryPayload {
  final String title;
  final String description;
  CreateCategoryPayload(this.title, this.description);
}

class CreateItemPayload {
  final String text;
  final String categoryUid;
  CreateItemPayload(this.text, this.categoryUid);
}

class CreateNotePayload {
  final String text;
  CreateNotePayload(this.text);
}

////////////////////
/// Action Map
///////////////////

createCreationMiddleware(FirebaseClient client) =>
    (new MiddlwareBuilder<App, AppBuilder, AppActions>()
          ..add<CreateBoardPayload>(CreationMiddlewareActionsNames.board, _createBoard(client))
          ..add<CreateSessionPayload>(
              CreationMiddlewareActionsNames.session, _createSession(client))
          ..add<CreateCategoryPayload>(
              CreationMiddlewareActionsNames.category, _createCategory(client))
          ..add<CreateItemPayload>(CreationMiddlewareActionsNames.item, _createItem(client))
          ..add<CreateNotePayload>(CreationMiddlewareActionsNames.note, _createNote(client)))
        .build();

////////////////////
/// Handlers
///////////////////
///
_createNote(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateNotePayload> action,
    ) =>
        client.createNote(
          api.state.boards.currentUid,
          api.state.sessions.currentUid,
          api.state.users.currentUid,
          action.payload.text,
        );

_createItem(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateItemPayload> action,
    ) =>
        client.createItem(
          api.state.boards.currentUid,
          api.state.sessions.currentUid,
          api.state.users.currentUid,
          action.payload.categoryUid,
          action.payload.text,
        );

_createCategory(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateCategoryPayload> action,
    ) =>
        client.createCategory(
          api.state.boards.currentUid,
          api.state.sessions.currentUid,
          action.payload.title,
          action.payload.description,
        );

_createSession(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateSessionPayload> action,
    ) =>
        client.createSession(
          api.state.boards.currentUid,
          action.payload.targetTime,
        );

_createBoard(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateBoardPayload> action,
    ) =>
        client.createBoard(
          api.state.users.currentUid,
          action.payload.title,
          action.payload.description,
          action.payload.interval,
          action.payload.intervalKind,
        );
