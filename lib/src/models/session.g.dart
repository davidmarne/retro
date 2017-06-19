// GENERATED CODE - DO NOT MODIFY BY HAND

part of session;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library session
// **************************************************************************

Serializer<Session> _$sessionSerializer = new _$SessionSerializer();

class _$SessionSerializer implements StructuredSerializer<Session> {
  @override
  final Iterable<Type> types = const [Session, _$Session];
  @override
  final String wireName = 'Session';

  @override
  Iterable serialize(Serializers serializers, Session object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'boardUid',
      serializers.serialize(object.boardUid,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'targetTime',
      serializers.serialize(object.targetTime,
          specifiedType: const FullType(int)),
      'startTime',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(int)),
      'endTime',
      serializers.serialize(object.endTime, specifiedType: const FullType(int)),
      'topicStartTime',
      serializers.serialize(object.topicStartTime,
          specifiedType: const FullType(int)),
      'topicEndTime',
      serializers.serialize(object.topicEndTime,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Session deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new SessionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'boardUid':
          result.boardUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'targetTime':
          result.targetTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'endTime':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'topicStartTime':
          result.topicStartTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'topicEndTime':
          result.topicEndTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Session
// **************************************************************************

class _$Session extends Session {
  @override
  final String uid;
  @override
  final String boardUid;
  @override
  final String title;
  @override
  final int targetTime;
  @override
  final int startTime;
  @override
  final int endTime;
  @override
  final int topicStartTime;
  @override
  final int topicEndTime;
  bool __started;
  bool __completed;
  String __state;
  String __startTimeStr;
  String __endTimeStr;
  String __topicStartTimeStr;
  String __topicEndTimeStr;

  factory _$Session([void updates(SessionBuilder b)]) =>
      (new SessionBuilder()..update(updates)).build();

  _$Session._(
      {this.uid,
      this.boardUid,
      this.title,
      this.targetTime,
      this.startTime,
      this.endTime,
      this.topicStartTime,
      this.topicEndTime})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUid == null) throw new ArgumentError.notNull('boardUid');
    if (title == null) throw new ArgumentError.notNull('title');
    if (targetTime == null) throw new ArgumentError.notNull('targetTime');
    if (startTime == null) throw new ArgumentError.notNull('startTime');
    if (endTime == null) throw new ArgumentError.notNull('endTime');
    if (topicStartTime == null)
      throw new ArgumentError.notNull('topicStartTime');
    if (topicEndTime == null) throw new ArgumentError.notNull('topicEndTime');
  }

  @override
  bool get started => __started ??= super.started;

  @override
  bool get completed => __completed ??= super.completed;

  @override
  String get state => __state ??= super.state;

  @override
  String get startTimeStr => __startTimeStr ??= super.startTimeStr;

  @override
  String get endTimeStr => __endTimeStr ??= super.endTimeStr;

  @override
  String get topicStartTimeStr =>
      __topicStartTimeStr ??= super.topicStartTimeStr;

  @override
  String get topicEndTimeStr => __topicEndTimeStr ??= super.topicEndTimeStr;

  @override
  Session rebuild(void updates(SessionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionBuilder toBuilder() => new SessionBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Session) return false;
    return uid == other.uid &&
        boardUid == other.boardUid &&
        title == other.title &&
        targetTime == other.targetTime &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        topicStartTime == other.topicStartTime &&
        topicEndTime == other.topicEndTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, uid.hashCode), boardUid.hashCode),
                            title.hashCode),
                        targetTime.hashCode),
                    startTime.hashCode),
                endTime.hashCode),
            topicStartTime.hashCode),
        topicEndTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Session')
          ..add('uid', uid)
          ..add('boardUid', boardUid)
          ..add('title', title)
          ..add('targetTime', targetTime)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('topicStartTime', topicStartTime)
          ..add('topicEndTime', topicEndTime))
        .toString();
  }
}

class SessionBuilder implements Builder<Session, SessionBuilder> {
  _$Session _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _boardUid;
  String get boardUid => _$this._boardUid;
  set boardUid(String boardUid) => _$this._boardUid = boardUid;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _targetTime;
  int get targetTime => _$this._targetTime;
  set targetTime(int targetTime) => _$this._targetTime = targetTime;

  int _startTime;
  int get startTime => _$this._startTime;
  set startTime(int startTime) => _$this._startTime = startTime;

  int _endTime;
  int get endTime => _$this._endTime;
  set endTime(int endTime) => _$this._endTime = endTime;

  int _topicStartTime;
  int get topicStartTime => _$this._topicStartTime;
  set topicStartTime(int topicStartTime) =>
      _$this._topicStartTime = topicStartTime;

  int _topicEndTime;
  int get topicEndTime => _$this._topicEndTime;
  set topicEndTime(int topicEndTime) => _$this._topicEndTime = topicEndTime;

  SessionBuilder();

  SessionBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUid = _$v.boardUid;
      _title = _$v.title;
      _targetTime = _$v.targetTime;
      _startTime = _$v.startTime;
      _endTime = _$v.endTime;
      _topicStartTime = _$v.topicStartTime;
      _topicEndTime = _$v.topicEndTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Session other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Session;
  }

  @override
  void update(void updates(SessionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Session build() {
    final result = _$v ??
        new _$Session._(
            uid: uid,
            boardUid: boardUid,
            title: title,
            targetTime: targetTime,
            startTime: startTime,
            endTime: endTime,
            topicStartTime: topicStartTime,
            topicEndTime: topicEndTime);
    replace(result);
    return result;
  }
}
