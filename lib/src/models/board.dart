library board;

import 'package:intl/intl.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import './category.dart';
import './item.dart';
import './note.dart';

part 'board.g.dart';

final formatter = new DateFormat.yMMMMd("en_US");

/// [Board]
abstract class Board implements Built<Board, BoardBuilder> {
  static Serializer<Board> get serializer => _$boardSerializer;

  /// [id] is the board's identifier
  String get uid;

  /// [groupUid] is the group's identifier
  String get groupUid;

  /// [displayName] is the board's display name
  String get displayName;

  /// [description] is the board's description
  String get description;

  int get startDate;

  int get endDate;

  /// [categories] are the categories the board contains
  BuiltMap<String, Category> get categories;

  /// [items] are the items the board contains
  BuiltMap<String, Item> get items;

  /// [notes] are the notes the board contains
  BuiltMap<String, Note> get notes;

  // Built value boilerplate
  Board._();
  factory Board([updates(BoardBuilder b)]) = _$Board;

  @memoized
  String get startDateStr => formatter.format(new DateTime.fromMillisecondsSinceEpoch(startDate));

  @memoized
  String get endDateStr => formatter.format(new DateTime.fromMillisecondsSinceEpoch(endDate));
}
