library session;

import 'package:intl/intl.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session.g.dart';

final timeFormat = new DateFormat.Hm("en_US");
final dateFormat = new DateFormat.yMMMMd("en_US");

/// [Session]
abstract class Session implements Built<Session, SessionBuilder> {
  static Serializer<Session> get serializer => _$sessionSerializer;

  String get uid;

  String get boardUid;

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

  @memoized
  String get startTimeStr => timeFormat.format(new DateTime.fromMillisecondsSinceEpoch(startTime));

  @memoized
  String get endTimeStr => timeFormat.format(new DateTime.fromMillisecondsSinceEpoch(endTime));
}
