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

  String get categoryUid;

  /// [ownerUid] is the user uid of the item's owner
  String get ownerUid;

  /// [supporterUids] user uids mapped to a short blurb describing their support.
  BuiltMap<String, String> get supporterUids;

  String get text;

  /// [time] spent discussing the Item during presentation
  int get time;

  /// [visible] when false, prevent Item from appearing in any sets.
  bool get visible;

  // Built value boilerplate
  Item._();
  factory Item([updates(ItemBuilder b)]) = _$Item;
}
