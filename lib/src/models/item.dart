library item;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'item.g.dart';

/// [Item]
abstract class Item implements Built<Item, ItemBuilder> {
  static Serializer<Item> get serializer => _$itemSerializer;

  /// [id] is the item's identifier
  String get uid;

  /// [text] is the item's text
  String get text;

  String get ownerUid;

  String get categoryUid;

  BuiltMap<String, bool> get ups;

  BuiltMap<String, bool> get downs;

  // Built value boilerplate
  Item._();
  factory Item([updates(ItemBuilder b)]) = _$Item;
}
