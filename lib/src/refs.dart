import 'package:firebase/firebase.dart' as firebase;

/// [Refs] contains getters for references to the firebase db
class Refs {
  final firebase.Database _db;

  Refs(this._db);

  /// [users] is a ref to all users
  firebase.DatabaseReference users() => _ref('users/');

  /// [user] is a ref to the user with the given uid
  firebase.DatabaseReference user(String uid) => _ref('users/$uid');

  /// [userBoards] is a ref to the users boards with the given uid
  firebase.DatabaseReference userBoards(String userUid) => _ref('users/$userUid/boardUids/');

  /// [boards] is a ref to all boards
  firebase.DatabaseReference boards() => _ref('boards/');

  /// [board] is a ref to a board
  firebase.DatabaseReference board(String boardUid) => _ref('boards/$boardUid');

  /// [boardMembers] is a ref to all boards member uids
  firebase.DatabaseReference boardMembers(String boardUid) => _ref('boards/$boardUid/memberUids/');

  /// [sessions] is a ref to all sessions for a given board
  firebase.DatabaseReference sessions(String boardUid) => _ref('sessions/$boardUid/');

  /// [session] is a ref to a session
  firebase.DatabaseReference session(String boardUid, String sessionUid) =>
      _ref('sessions/$boardUid/$sessionUid');

  /// [categories] is a ref to all cetegories for a given board
  firebase.DatabaseReference categories(String boardUid, String sessionUid) =>
      _ref('categories/$boardUid/$sessionUid/');

  /// [category] is a ref to an item in a given board in a given session
  firebase.DatabaseReference category(String boardUid, String sessionUid, String categoryUid) =>
      _ref('categories/$boardUid/$sessionUid/$categoryUid/');

  /// [items] is a ref to the items for a given board and session
  firebase.DatabaseReference items(String boardUid, String sessionUid) =>
      _ref('items/$boardUid/$sessionUid/');

  /// [item] is a ref to an item in a given board in a given session
  firebase.DatabaseReference item(String boardUid, String sessionUid, String itemUid) =>
      _ref('items/$boardUid/$sessionUid/$itemUid/');

  /// [sessionNotes] is a ref to alll notes for a given board and session
  firebase.DatabaseReference notes(String boardUid, String sessionUid) =>
      _ref('notes/$boardUid/$sessionUid/');

  /// [note] is a ref to an note in a given board in a given session
  firebase.DatabaseReference note(String boardUid, String sessionUid, String noteUid) =>
      _ref('items/$boardUid/$sessionUid/$noteUid/');

  firebase.DatabaseReference _ref(String uid) => _db.ref(uid);
}
