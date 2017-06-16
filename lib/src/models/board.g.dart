// GENERATED CODE - DO NOT MODIFY BY HAND

part of board;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library board
// **************************************************************************

Serializer<Board> _$boardSerializer = new _$BoardSerializer();

class _$BoardSerializer implements StructuredSerializer<Board> {
  @override
  final Iterable<Type> types = const [Board, _$Board];
  @override
  final String wireName = 'Board';

  @override
  Iterable serialize(Serializers serializers, Board object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'ownerUid',
      serializers.serialize(object.ownerUid,
          specifiedType: const FullType(String)),
      'memberUids',
      serializers.serialize(object.memberUids,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
      'sessionUids',
      serializers.serialize(object.sessionUids,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Board deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new BoardBuilder();

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
        case 'ownerUid':
          result.ownerUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'memberUids':
          result.memberUids.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap<String, int>);
          break;
        case 'sessionUids':
          result.sessionUids.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap<String, int>);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Board
// **************************************************************************

class _$Board extends Board {
  @override
  final String uid;
  @override
  final String ownerUid;
  @override
  final BuiltMap<String, int> memberUids;
  @override
  final BuiltMap<String, int> sessionUids;
  @override
  final String title;
  @override
  final String description;

  factory _$Board([void updates(BoardBuilder b)]) =>
      (new BoardBuilder()..update(updates)).build();

  _$Board._(
      {this.uid,
      this.ownerUid,
      this.memberUids,
      this.sessionUids,
      this.title,
      this.description})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (ownerUid == null) throw new ArgumentError.notNull('ownerUid');
    if (memberUids == null) throw new ArgumentError.notNull('memberUids');
    if (sessionUids == null) throw new ArgumentError.notNull('sessionUids');
    if (title == null) throw new ArgumentError.notNull('title');
    if (description == null) throw new ArgumentError.notNull('description');
  }

  @override
  Board rebuild(void updates(BoardBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardBuilder toBuilder() => new BoardBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Board) return false;
    return uid == other.uid &&
        ownerUid == other.ownerUid &&
        memberUids == other.memberUids &&
        sessionUids == other.sessionUids &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uid.hashCode), ownerUid.hashCode),
                    memberUids.hashCode),
                sessionUids.hashCode),
            title.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Board')
          ..add('uid', uid)
          ..add('ownerUid', ownerUid)
          ..add('memberUids', memberUids)
          ..add('sessionUids', sessionUids)
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class BoardBuilder implements Builder<Board, BoardBuilder> {
  _$Board _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _ownerUid;
  String get ownerUid => _$this._ownerUid;
  set ownerUid(String ownerUid) => _$this._ownerUid = ownerUid;

  MapBuilder<String, int> _memberUids;
  MapBuilder<String, int> get memberUids =>
      _$this._memberUids ??= new MapBuilder<String, int>();
  set memberUids(MapBuilder<String, int> memberUids) =>
      _$this._memberUids = memberUids;

  MapBuilder<String, int> _sessionUids;
  MapBuilder<String, int> get sessionUids =>
      _$this._sessionUids ??= new MapBuilder<String, int>();
  set sessionUids(MapBuilder<String, int> sessionUids) =>
      _$this._sessionUids = sessionUids;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  BoardBuilder();

  BoardBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _ownerUid = _$v.ownerUid;
      _memberUids = _$v.memberUids?.toBuilder();
      _sessionUids = _$v.sessionUids?.toBuilder();
      _title = _$v.title;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Board other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Board;
  }

  @override
  void update(void updates(BoardBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Board build() {
    final result = _$v ??
        new _$Board._(
            uid: uid,
            ownerUid: ownerUid,
            memberUids: memberUids?.build(),
            sessionUids: sessionUids?.build(),
            title: title,
            description: description);
    replace(result);
    return result;
  }
}