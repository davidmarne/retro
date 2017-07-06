library session;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session.g.dart';

/// [Session]
abstract class Session implements Built<Session, SessionBuilder> {
  static Serializer<Session> get serializer => _$sessionSerializer;

  String get uid;

  String get boardUid;

  /// uid for the User who is driving the session.
  @nullable
  String get presenterUid;

  /// uid for the Item being desplayed.
  @nullable
  String get presentedUid;

  int get createdDate;

  int get targetTime;

  int get startTime;

  int get endTime;

  // Built value boilerplate
  Session._();
  factory Session([updates(SessionBuilder b)]) = _$Session;

  @memoized
  bool get started => startTime != 0;

  @memoized
  bool get completed => endTime != 0;

  @memoized
  String get state {
    if (!started) return "Not Started";
    if (started && !completed) return "In Progress";
    return "Complete";
  }
}
