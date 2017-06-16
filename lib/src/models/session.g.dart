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
      'targetTime',
      serializers.serialize(object.targetTime,
          specifiedType: const FullType(int)),
      'startDate',
      serializers.serialize(object.startDate,
          specifiedType: const FullType(int)),
      'endDate',
      serializers.serialize(object.endDate, specifiedType: const FullType(int)),
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
        case 'targetTime':
          result.targetTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
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
  final int targetTime;
  @override
  final int startDate;
  @override
  final int endDate;
  String __startDateStr;
  String __endDateStr;

  factory _$Session([void updates(SessionBuilder b)]) =>
      (new SessionBuilder()..update(updates)).build();

  _$Session._(
      {this.uid, this.boardUid, this.targetTime, this.startDate, this.endDate})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUid == null) throw new ArgumentError.notNull('boardUid');
    if (targetTime == null) throw new ArgumentError.notNull('targetTime');
    if (startDate == null) throw new ArgumentError.notNull('startDate');
    if (endDate == null) throw new ArgumentError.notNull('endDate');
  }

  @override
  String get startDateStr => __startDateStr ??= super.startDateStr;

  @override
  String get endDateStr => __endDateStr ??= super.endDateStr;

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
        targetTime == other.targetTime &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), boardUid.hashCode),
                targetTime.hashCode),
            startDate.hashCode),
        endDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Session')
          ..add('uid', uid)
          ..add('boardUid', boardUid)
          ..add('targetTime', targetTime)
          ..add('startDate', startDate)
          ..add('endDate', endDate))
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

  int _targetTime;
  int get targetTime => _$this._targetTime;
  set targetTime(int targetTime) => _$this._targetTime = targetTime;

  int _startDate;
  int get startDate => _$this._startDate;
  set startDate(int startDate) => _$this._startDate = startDate;

  int _endDate;
  int get endDate => _$this._endDate;
  set endDate(int endDate) => _$this._endDate = endDate;

  SessionBuilder();

  SessionBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUid = _$v.boardUid;
      _targetTime = _$v.targetTime;
      _startDate = _$v.startDate;
      _endDate = _$v.endDate;
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
            targetTime: targetTime,
            startDate: startDate,
            endDate: endDate);
    replace(result);
    return result;
  }
}
