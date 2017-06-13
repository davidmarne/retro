library group;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'group.g.dart';

/// [Group]
abstract class Group implements Built<Group, GroupBuilder> {
  static Serializer<Group> get serializer => _$groupSerializer;

  /// [id] is the group's identifier
  String get uid;

  /// [displayName] is the group's display name
  String get displayName;

  /// [description] is the group's description
  String get description;

  /// [boards] are the boards the group contains
  BuiltMap<String, bool> get boards;

  /// [users] are the users the group contains
  BuiltMap<String, bool> get users;

  // Built value boilerplate
  Group._();
  factory Group([updates(GroupBuilder b)]) = _$Group;
}
