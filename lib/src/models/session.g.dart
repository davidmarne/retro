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
      'createdDate',
      serializers.serialize(object.createdDate,
          specifiedType: const FullType(int)),
      'targetTime',
      serializers.serialize(object.targetTime,
          specifiedType: const FullType(int)),
      'startTime',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(int)),
      'endTime',
      serializers.serialize(object.endTime, specifiedType: const FullType(int)),
    ];
    if (object.presentedUid != null) {
      result
        ..add('presentedUid')
        ..add(serializers.serialize(object.presentedUid,
            specifiedType: const FullType(String)));
    }
    if (object.presentedDate != null) {
      result
        ..add('presentedDate')
        ..add(serializers.serialize(object.presentedDate,
            specifiedType: const FullType(int)));
    }

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
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
        case 'presentedUid':
          result.presentedUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'presentedDate':
          result.presentedDate = serializers.deserialize(value,
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
  final int createdDate;
  @override
  final int targetTime;
  @override
  final int startTime;
  @override
  final int endTime;
  @override
  final String presentedUid;
  @override
  final int presentedDate;
  bool __started;
  bool __completed;
  String __state;

  factory _$Session([void updates(SessionBuilder b)]) =>
      (new SessionBuilder()..update(updates)).build();

  _$Session._(
      {this.uid,
      this.boardUid,
      this.createdDate,
      this.targetTime,
      this.startTime,
      this.endTime,
      this.presentedUid,
      this.presentedDate})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUid == null) throw new ArgumentError.notNull('boardUid');
    if (createdDate == null) throw new ArgumentError.notNull('createdDate');
    if (targetTime == null) throw new ArgumentError.notNull('targetTime');
    if (startTime == null) throw new ArgumentError.notNull('startTime');
    if (endTime == null) throw new ArgumentError.notNull('endTime');
  }

  @override
  bool get started => __started ??= super.started;

  @override
  bool get completed => __completed ??= super.completed;

  @override
  String get state => __state ??= super.state;

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
        createdDate == other.createdDate &&
        targetTime == other.targetTime &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        presentedUid == other.presentedUid &&
        presentedDate == other.presentedDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, uid.hashCode), boardUid.hashCode),
                            createdDate.hashCode),
                        targetTime.hashCode),
                    startTime.hashCode),
                endTime.hashCode),
            presentedUid.hashCode),
        presentedDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Session')
          ..add('uid', uid)
          ..add('boardUid', boardUid)
          ..add('createdDate', createdDate)
          ..add('targetTime', targetTime)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('presentedUid', presentedUid)
          ..add('presentedDate', presentedDate))
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

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  int _targetTime;
  int get targetTime => _$this._targetTime;
  set targetTime(int targetTime) => _$this._targetTime = targetTime;

  int _startTime;
  int get startTime => _$this._startTime;
  set startTime(int startTime) => _$this._startTime = startTime;

  int _endTime;
  int get endTime => _$this._endTime;
  set endTime(int endTime) => _$this._endTime = endTime;

  String _presentedUid;
  String get presentedUid => _$this._presentedUid;
  set presentedUid(String presentedUid) => _$this._presentedUid = presentedUid;

  int _presentedDate;
  int get presentedDate => _$this._presentedDate;
  set presentedDate(int presentedDate) => _$this._presentedDate = presentedDate;

  SessionBuilder();

  SessionBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUid = _$v.boardUid;
      _createdDate = _$v.createdDate;
      _targetTime = _$v.targetTime;
      _startTime = _$v.startTime;
      _endTime = _$v.endTime;
      _presentedUid = _$v.presentedUid;
      _presentedDate = _$v.presentedDate;
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
            createdDate: createdDate,
            targetTime: targetTime,
            startTime: startTime,
            endTime: endTime,
            presentedUid: presentedUid,
            presentedDate: presentedDate);
    replace(result);
    return result;
  }
}
