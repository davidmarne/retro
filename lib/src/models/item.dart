library item;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'item.g.dart';

/// [Item]
abstract class Item implements Built<Item, ItemBuilder> {
  static Serializer<Item> get serializer => _$itemSerializer;

  String get uid;

  String get boardUid;

  String get sessionUid;

  /// [ownerUid] is the user uid of the item's owner
  String get ownerUid;

  String get categoryUid;

  /// [noteUids] note uids tagged to this item.
  BuiltMap<String, bool> get noteUids;

  /// [supporterUids] uids of supportive users.
  BuiltMap<String, bool> get supporterUids;

  /// [time] spent discussing the Item during presentation
  int get time;

  String get text;

  /// [visible] when false, prevent Item from appearing in any sets.
  bool get visible;

  // Built value boilerplate
  Item._();
  factory Item([updates(ItemBuilder b)]) = _$Item;
}
