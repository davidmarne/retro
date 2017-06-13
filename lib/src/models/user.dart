library user;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// [User]
abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  /// [id] is the users identifier
  String get uid;

  /// [displayName] is the users display name
  String get displayName;

  /// [groups] are the groups the user is part of
  BuiltMap<String, bool> get groups;

  // Built value boilerplate
  User._();
  factory User([updates(UserBuilder b)]) = _$User;
}
