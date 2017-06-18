library user;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// [User]
abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String get uid;

  /// [boardUids] contains board uids and board join dates.
  BuiltMap<String, int> get boardUids;

  /// [name] is the users display name
  String get name;

  // Built value boilerplate
  User._();
  factory User([updates(UserBuilder b)]) = _$User;
}
