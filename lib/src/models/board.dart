library board;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'board.g.dart';

/// [Board]
abstract class Board implements Built<Board, BoardBuilder> {
  static Serializer<Board> get serializer => _$boardSerializer;

  /// [uid] is the board's identifier
  String get uid;

  /// [ownerUid] is the user uid of the board's owner
  String get ownerUid;

  /// [memberUids] contains user uids and last active dates for board's member users.
  BuiltMap<String, int> get memberUids;

  String get title;

  String get description;

  int get interval;

  // day, week, month, year
  int get intervalKind;

  // Built value boilerplate
  Board._();
  factory Board([updates(BoardBuilder b)]) = _$Board;

  @memoized
  bool get repeated => interval != 0;
}
