// GENERATED CODE - DO NOT MODIFY BY HAND

part of note;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<Note> _$noteSerializer = new _$NoteSerializer();

class _$NoteSerializer implements StructuredSerializer<Note> {
  @override
  final Iterable<Type> types = const [Note, _$Note];
  @override
  final String wireName = 'Note';

  @override
  Iterable serialize(Serializers serializers, Note object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'boardUid',
      serializers.serialize(object.boardUid,
          specifiedType: const FullType(String)),
      'sessionUid',
      serializers.serialize(object.sessionUid,
          specifiedType: const FullType(String)),
      'ownerUid',
      serializers.serialize(object.ownerUid,
          specifiedType: const FullType(String)),
      'itemUids',
      serializers.serialize(object.itemUids,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)])),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'visible',
      serializers.serialize(object.visible,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Note deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new NoteBuilder();

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
        case 'sessionUid':
          result.sessionUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownerUid':
          result.ownerUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'itemUids':
          result.itemUids.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltMap<String, bool>);
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'visible':
          result.visible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Note extends Note {
  @override
  final String uid;
  @override
  final String boardUid;
  @override
  final String sessionUid;
  @override
  final String ownerUid;
  @override
  final BuiltMap<String, bool> itemUids;
  @override
  final String text;
  @override
  final bool visible;

  factory _$Note([void updates(NoteBuilder b)]) =>
      (new NoteBuilder()..update(updates)).build();

  _$Note._(
      {this.uid,
      this.boardUid,
      this.sessionUid,
      this.ownerUid,
      this.itemUids,
      this.text,
      this.visible})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUid == null) throw new ArgumentError.notNull('boardUid');
    if (sessionUid == null) throw new ArgumentError.notNull('sessionUid');
    if (ownerUid == null) throw new ArgumentError.notNull('ownerUid');
    if (itemUids == null) throw new ArgumentError.notNull('itemUids');
    if (text == null) throw new ArgumentError.notNull('text');
    if (visible == null) throw new ArgumentError.notNull('visible');
  }

  @override
  Note rebuild(void updates(NoteBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NoteBuilder toBuilder() => new NoteBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Note) return false;
    return uid == other.uid &&
        boardUid == other.boardUid &&
        sessionUid == other.sessionUid &&
        ownerUid == other.ownerUid &&
        itemUids == other.itemUids &&
        text == other.text &&
        visible == other.visible;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, uid.hashCode), boardUid.hashCode),
                        sessionUid.hashCode),
                    ownerUid.hashCode),
                itemUids.hashCode),
            text.hashCode),
        visible.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Note')
          ..add('uid', uid)
          ..add('boardUid', boardUid)
          ..add('sessionUid', sessionUid)
          ..add('ownerUid', ownerUid)
          ..add('itemUids', itemUids)
          ..add('text', text)
          ..add('visible', visible))
        .toString();
  }
}

class NoteBuilder implements Builder<Note, NoteBuilder> {
  _$Note _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _boardUid;
  String get boardUid => _$this._boardUid;
  set boardUid(String boardUid) => _$this._boardUid = boardUid;

  String _sessionUid;
  String get sessionUid => _$this._sessionUid;
  set sessionUid(String sessionUid) => _$this._sessionUid = sessionUid;

  String _ownerUid;
  String get ownerUid => _$this._ownerUid;
  set ownerUid(String ownerUid) => _$this._ownerUid = ownerUid;

  MapBuilder<String, bool> _itemUids;
  MapBuilder<String, bool> get itemUids =>
      _$this._itemUids ??= new MapBuilder<String, bool>();
  set itemUids(MapBuilder<String, bool> itemUids) =>
      _$this._itemUids = itemUids;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  bool _visible;
  bool get visible => _$this._visible;
  set visible(bool visible) => _$this._visible = visible;

  NoteBuilder();

  NoteBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUid = _$v.boardUid;
      _sessionUid = _$v.sessionUid;
      _ownerUid = _$v.ownerUid;
      _itemUids = _$v.itemUids?.toBuilder();
      _text = _$v.text;
      _visible = _$v.visible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Note other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Note;
  }

  @override
  void update(void updates(NoteBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Note build() {
    final _$result = _$v ??
        new _$Note._(
            uid: uid,
            boardUid: boardUid,
            sessionUid: sessionUid,
            ownerUid: ownerUid,
            itemUids: itemUids?.build(),
            text: text,
            visible: visible);
    replace(_$result);
    return _$result;
  }
}
