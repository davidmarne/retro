import 'dart:async';
import 'package:firebase/firebase.dart' as firebase;

import './refs.dart';
import './streamSubManager.dart';
import './serializers.dart';

import './state/app.dart';

import './models/item.dart';
import './models/note.dart';
import './models/category.dart';
import './models/board.dart';
import './models/user.dart';
import './models/session.dart';
import './models/dateIntervalKinds.dart';

class FirebaseClient {
  final Refs _refs;
  final StreamSubManager _subMgr;
  final AppActions _actions;

  FirebaseClient(this._refs, this._subMgr, this._actions);

  /// [createNote] creates a note and associates it with the item
  Future<Note> createNote(String boardUid, String sessionUid, String ownerUid, String text) async {
    var note = await _createNote(boardUid, sessionUid, ownerUid, text);
    // _addNoteToItem(note.uid, boardUid, sessionUid);
    return note;
  }

  /// [createItem] creates an item
  Future<Item> createItem(
    String boardUid,
    String sessionUid,
    String ownerUid,
    String categoryUid,
    String text,
  ) =>
      _createItem(boardUid, sessionUid, ownerUid, categoryUid, text);

  /// [createCategory] creates a category and associates it with a session
  Future<Category> createCategory(
    String boardUid,
    String sessionUid,
    String title,
    String description,
  ) async {
    var category = await _createCategory(boardUid, sessionUid, title, description);
    return category;
  }

  /// [createSession] creates a session
  Future<Session> createSession(String boardUid, int targetTime) async {
    var session = await _createSession(boardUid, targetTime: targetTime);
    await setBoardsLatestSession(boardUid, session.uid);
    return session;
  }

  /// [createBoard] creates a board, associates it with a user, and creates the initial session
  /// if the interval is not zero
  Future<Board> createBoard(
    String ownerUid,
    String title,
    String description,
  ) async {
    var board = await _createBoard(
      ownerUid,
      title,
      description,
    );
    await setUsersLatestBoard(ownerUid, board.uid);
    return board;
  }

  /// [userFromFirebaseUser] gets a user
  Future<User> userFromFirebaseUser(firebase.User fbUser) async {
    var userRef = await _refs.user(fbUser.uid).once('value');
    final user = userRef.snapshot.val();
    if (user == null) {
      return await _createUser(fbUser.uid, fbUser.displayName);
    }
    return serializers.deserializeWith(User.serializer, user);
  }

  /// [subToUser] subscribes to user
  subToUser(String userUid) {
    _subMgr.add<User>(
      _refs.user(userUid),
      _actions.users.update,
      User.serializer,
    );
  }

  /// [subToBoards] subscribes to boards
  subToBoards(Iterable<String> boardUids) {
    boardUids.forEach((uid) => _subMgr.add<Board>(
          _refs.board(uid),
          _actions.boards.update,
          Board.serializer,
        ));
  }

  /// [subToUsers] subscribes to users
  subToUsers(Iterable<String> userUids) {
    userUids.forEach((uid) => _subMgr.add<User>(
          _refs.user(uid),
          _actions.users.update,
          User.serializer,
        ));
  }

  /// [subToSessions] subscribes to sessions
  subToSessions(String boardUid) {
    _subMgr.addList<Session>(
      _refs.sessions(boardUid),
      Session.serializer,
      onChildAdded: _actions.sessions.update,
      onChildRemoved: _actions.sessions.remove,
      onChildChanged: _actions.sessions.update,
    );
  }

  /// [subToItems] subscribes to items
  subToItems(String boardUid, String sessionUid) {
    _subMgr.addList<Item>(
      _refs.items(boardUid, sessionUid),
      Item.serializer,
      onChildAdded: _actions.items.update,
      onChildRemoved: _actions.items.remove,
      onChildChanged: _actions.items.update,
    );
  }

  /// [subToCategories] subscribes to categories
  subToCategories(String boardUid, String sessionUid) {
    _subMgr.addList<Category>(
      _refs.categories(boardUid, sessionUid),
      Category.serializer,
      onChildAdded: _actions.categories.update,
      onChildRemoved: _actions.categories.remove,
      onChildChanged: _actions.categories.update,
    );
  }

  /// [subToNotes] subscribes to notes
  subToNotes(String boardUid, String sessionUid) {
    _subMgr.addList<Note>(
      _refs.notes(boardUid, sessionUid),
      Note.serializer,
      onChildAdded: _actions.notes.update,
      onChildRemoved: _actions.notes.remove,
      onChildChanged: _actions.notes.update,
    );
  }

  Future setUsersLatestBoard(String userUid, String boardUid) async {
    var now = new DateTime.now().millisecondsSinceEpoch;
    await _refs.userBoards(userUid).child(boardUid).set(now);
    await _refs.boardMembers(boardUid).child(userUid).set(now);
  }

  Future setBoardsLatestSession(String boardUid, String sessionUid) async {
    await _refs.board(boardUid).child("latestSessionUid").set(sessionUid);
  }

  Future addSupport(String userUid, String boardUid, String sessionUid, String itemUid) async {
    await _refs.item(boardUid, sessionUid, itemUid).child("supporterUids").child(userUid).set(true);
  }

  Future removeSupport(String userUid, String boardUid, String sessionUid, String itemUid) async {
    await _refs.item(boardUid, sessionUid, itemUid).child("supporterUids").child(userUid).remove();
  }

  ////////////////
  /// Internals
  ////////////////

  Future<Note> _createNote(
    String boardUid,
    String sessionUid,
    String ownerUid,
    String text,
  ) async {
    final newNoteRef = await _refs.notes(boardUid, sessionUid).push().future;
    final note = new Note((NoteBuilder b) => b
      ..uid = newNoteRef.key
      ..boardUid = boardUid
      ..sessionUid = sessionUid
      ..ownerUid = ownerUid
      ..text = text
      ..visible = true);

    newNoteRef.set(serializers.serializeWith(Note.serializer, note));
    return note;
  }

  Future<Item> _createItem(
    String boardUid,
    String sessionUid,
    String ownerUid,
    String categoryUid,
    String text,
  ) async {
    final newItemRef = await _refs.items(boardUid, sessionUid).push().future;
    final item = new Item((ItemBuilder b) => b
      ..uid = newItemRef.key
      ..boardUid = boardUid
      ..sessionUid = sessionUid
      ..ownerUid = ownerUid
      ..categoryUid = categoryUid
      ..time = 0
      ..text = text
      ..visible = true);

    newItemRef.set(serializers.serializeWith(Item.serializer, item));
    return item;
  }

  Future<Category> _createCategory(
    String boardUid,
    String sessionUid,
    String title,
    String description,
  ) async {
    final newCategoryRef = await _refs.categories(boardUid, sessionUid).push().future;
    final category = new Category((CategoryBuilder b) => b
      ..uid = newCategoryRef.key
      ..boardUid = boardUid
      ..sessionUid = sessionUid
      ..title = title
      ..description = description);

    newCategoryRef.set(serializers.serializeWith(Category.serializer, category));
    return category;
  }

  Future<Session> _createSession(
    String boardUid, {
    int targetTime: 3600000,
    int startTime: 0,
    int endTime: 0,
  }) async {
    final newSessionRef = await _refs.sessions(boardUid).push().future;
    final session = new Session((SessionBuilder b) => b
      ..uid = newSessionRef.key
      ..boardUid = boardUid
      ..targetTime = targetTime
      ..startTime = startTime
      ..endTime = endTime);

    newSessionRef.set(serializers.serializeWith(Session.serializer, session));
    return session;
  }

  Future<User> _createUser(String uid, String name) async {
    final newUserRef = await _refs.user(uid);
    final user = new User((UserBuilder b) => b
      ..uid = uid
      ..name = name);

    newUserRef.set(serializers.serializeWith(User.serializer, user));
    return user;
  }

  Future<Board> _createBoard(
    String ownerUid,
    String title,
    String description
  ) async {
    final newBoardRef = await _refs.boards().push().future;
    final board = new Board((BoardBuilder b) => b
      ..uid = newBoardRef.key
      ..ownerUid = ownerUid
      ..title = title
      ..description = description);
    newBoardRef.set(serializers.serializeWith(Board.serializer, board));
    return board;
  }
}
