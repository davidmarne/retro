import 'package:firebase/firebase.dart' as firebase;

/// [Refs] contains getters for references to the firebase db
class Refs {
  final firebase.Database _db;

  Refs(this._db);

  /// [user] is a ref to the user with the given uid
  firebase.DatabaseReference user(String uid) => _ref('users/$uid');

  /// [userGroups] is the ref to the list of groups the user with the given uid
  firebase.DatabaseReference userGroups(String uid) => _ref('users/$uid/groups/');

  /// [board] is a ref to a board
  firebase.DatabaseReference board(String groupUid, String boardUid) =>
      _ref('boards/$groupUid/$boardUid');

  /// [items] is a ref to the items in a given board
  firebase.DatabaseReference items(String groupUid, String boardUid) =>
      _ref('boards/$groupUid/$boardUid/items/');

  /// [categories] is a ref to the categories in a given board
  firebase.DatabaseReference categories(String groupUid, String boardUid) =>
      _ref('boards/$groupUid/$boardUid/categories/');

  /// [groups] is a ref to the list of all groups
  firebase.DatabaseReference groups() => _ref('groups/');

  /// [groups] is a ref to a group
  firebase.DatabaseReference group(String uid) => _ref('groups/$uid');

  /// [boardGroup] is a a ref to the list of boards for a group with the uid given
  firebase.DatabaseReference boardGroup(String groupUid) => _ref('boards/$groupUid/');

  /// [groupBoards] is a ref to the list of board uids for a group with the uid given
  firebase.DatabaseReference groupBoards(String groupUid) => _ref('groups/$groupUid/boards/');

  firebase.DatabaseReference _ref(String uid) => _db.ref(uid);
}
