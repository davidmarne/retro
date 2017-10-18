library creationMiddleware;

import 'dart:async';

import 'package:built_redux/built_redux.dart';

import '../firebaseClient.dart';
import '../models/category.dart';
import '../models/session.dart';
import '../state/app.dart';

part 'creationMiddleware.g.dart';

////////////////////
/// Actions
///////////////////

// Actions to be handled by this middleware
abstract class CreationMiddlewareActions extends ReduxActions {
  ActionDispatcher<CreateBoardPayload> board;
  ActionDispatcher<CreateSessionPayload> session;
  ActionDispatcher<Null> cloneSession;
  ActionDispatcher<CreateCategoryPayload> category;
  ActionDispatcher<CreateItemPayload> item;
  ActionDispatcher<String> note;

  CreationMiddlewareActions._();
  factory CreationMiddlewareActions() => new _$CreationMiddlewareActions();
}

////////////////////
/// Payloads
///////////////////

class CreateBoardPayload {
  final String title;
  final String description;
  CreateBoardPayload(this.title, this.description);
}

class CreateSessionPayload {
  final int targetTime;
  CreateSessionPayload(this.targetTime);
}

class CreateCategoryPayload {
  final String title;
  final String description;
  final String color;
  CreateCategoryPayload(this.title, this.description, this.color);
}

class CreateItemPayload {
  final String text;
  final List<String> options;
  final String categoryUid;
  CreateItemPayload(this.text, this.options, this.categoryUid);
}

////////////////////
/// Action Map
///////////////////

createCreationMiddleware(
        FirebaseClient client) =>
    (new MiddlewareBuilder<App, AppBuilder, AppActions>()
          ..add<CreateBoardPayload>(
              CreationMiddlewareActionsNames.board, _createBoard(client))
          ..add<CreateSessionPayload>(
              CreationMiddlewareActionsNames.session, _createSession(client))
          ..add<Null>(CreationMiddlewareActionsNames.cloneSession,
              _cloneSession(client))
          ..add<CreateCategoryPayload>(
              CreationMiddlewareActionsNames.category, _createCategory(client))
          ..add<CreateItemPayload>(
              CreationMiddlewareActionsNames.item, _createItem(client))
          ..add<String>(
              CreationMiddlewareActionsNames.note, _createNote(client)))
        .build();

////////////////////
/// Handlers
///////////////////

_createNote(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<String> action,
    ) =>
        client.createNote(
          api.state.boards.currentUid,
          api.state.sessions.currentUid,
          api.state.users.currentUid,
          action.payload,
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
          action.payload.options,
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
          action.payload.color,
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

_cloneSession(FirebaseClient client) =>
    (MiddlewareApi<App, AppBuilder, AppActions> api, ActionHandler next,
        Action<Null> action) async {
      Session session = api.state.sessions.current;
      if (session != null) {
        Session newSession = await client.createSession(
          session.boardUid,
          session.targetTime,
        );
        Iterable<Category> categories = api.state.categories.visible
            .where((cat) => cat.sessionUid == session.uid);
        if (categories.length > 0) {
          await Future.forEach(categories, (Category category) async {
            await client.createCategory(
              newSession.boardUid,
              newSession.uid,
              category.title,
              category.description,
              category.color,
            );
          });
        }
        return newSession;
      }
      return null;
    };

_createBoard(FirebaseClient client) => (
      MiddlewareApi<App, AppBuilder, AppActions> api,
      ActionHandler next,
      Action<CreateBoardPayload> action,
    ) =>
        client.createBoard(
          api.state.users.currentUid,
          action.payload.title,
          action.payload.description,
        );
