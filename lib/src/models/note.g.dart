// GENERATED CODE - DO NOT MODIFY BY HAND

part of note;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library note
// **************************************************************************

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
      'ownerUid',
      serializers.serialize(object.ownerUid,
          specifiedType: const FullType(String)),
      'categoryUid',
      serializers.serialize(object.categoryUid,
          specifiedType: const FullType(String)),
      'itemUid',
      serializers.serialize(object.itemUid,
          specifiedType: const FullType(String)),
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
        case 'ownerUid':
          result.ownerUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryUid':
          result.categoryUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'itemUid':
          result.itemUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Note
// **************************************************************************

class _$Note extends Note {
  @override
  final String uid;
  @override
  final String ownerUid;
  @override
  final String categoryUid;
  @override
  final String itemUid;

  factory _$Note([void updates(NoteBuilder b)]) =>
      (new NoteBuilder()..update(updates)).build();

  _$Note._({this.uid, this.ownerUid, this.categoryUid, this.itemUid})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (ownerUid == null) throw new ArgumentError.notNull('ownerUid');
    if (categoryUid == null) throw new ArgumentError.notNull('categoryUid');
    if (itemUid == null) throw new ArgumentError.notNull('itemUid');
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
        ownerUid == other.ownerUid &&
        categoryUid == other.categoryUid &&
        itemUid == other.itemUid;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, uid.hashCode), ownerUid.hashCode), categoryUid.hashCode),
        itemUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Note')
          ..add('uid', uid)
          ..add('ownerUid', ownerUid)
          ..add('categoryUid', categoryUid)
          ..add('itemUid', itemUid))
        .toString();
  }
}

class NoteBuilder implements Builder<Note, NoteBuilder> {
  _$Note _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _ownerUid;
  String get ownerUid => _$this._ownerUid;
  set ownerUid(String ownerUid) => _$this._ownerUid = ownerUid;

  String _categoryUid;
  String get categoryUid => _$this._categoryUid;
  set categoryUid(String categoryUid) => _$this._categoryUid = categoryUid;

  String _itemUid;
  String get itemUid => _$this._itemUid;
  set itemUid(String itemUid) => _$this._itemUid = itemUid;

  NoteBuilder();

  NoteBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _ownerUid = _$v.ownerUid;
      _categoryUid = _$v.categoryUid;
      _itemUid = _$v.itemUid;
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
    final result = _$v ??
        new _$Note._(
            uid: uid,
            ownerUid: ownerUid,
            categoryUid: categoryUid,
            itemUid: itemUid);
    replace(result);
    return result;
  }
}
