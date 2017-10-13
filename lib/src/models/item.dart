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

  /// Options for "Poll" items.
  BuiltList<String> get pollOptions;

  /// [pollResponses] chosen option for each participating user.
  BuiltMap<String, String> get pollResponses;

  /// [visible] when false, prevent Item from appearing in any sets.
  bool get visible;

  // Built value boilerplate
  Item._();
  factory Item([updates(ItemBuilder b)]) = _$Item;

  int responseCount() => pollResponses.keys.length;

  int optionCount(String option) => pollResponses.values.where((choice) => choice == option).length;

  int optionPercentage(String option) {
    final denom = responseCount();
    return denom > 0 ? (optionCount(option) / denom * 100).toInt() : 0;
  }
}
