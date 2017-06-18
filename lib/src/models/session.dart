library session;

import 'package:intl/intl.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session.g.dart';

final formatter = new DateFormat.yMMMMd("en_US");

/// [Session]
abstract class Session implements Built<Session, SessionBuilder> {
  static Serializer<Session> get serializer => _$sessionSerializer;

  String get uid;

  String get boardUid;

  int get targetTime;

  int get startDate;

  int get endDate;

  // Built value boilerplate
  Session._();
  factory Session([updates(SessionBuilder b)]) = _$Session;

  @memoized
  String get startDateStr => formatter.format(new DateTime.fromMillisecondsSinceEpoch(startDate));

  @memoized
  String get endDateStr => formatter.format(new DateTime.fromMillisecondsSinceEpoch(endDate));
}
