// GENERATED CODE - DO NOT MODIFY BY HAND

part of item;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library item
// **************************************************************************

Serializer<Item> _$itemSerializer = new _$ItemSerializer();

class _$ItemSerializer implements StructuredSerializer<Item> {
  @override
  final Iterable<Type> types = const [Item, _$Item];
  @override
  final String wireName = 'Item';

  @override
  Iterable serialize(Serializers serializers, Item object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'ownerUid',
      serializers.serialize(object.ownerUid,
          specifiedType: const FullType(String)),
      'categoryUid',
      serializers.serialize(object.categoryUid,
          specifiedType: const FullType(String)),
      'ups',
      serializers.serialize(object.ups,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)])),
      'downs',
      serializers.serialize(object.downs,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)])),
    ];

    return result;
  }

  @override
  Item deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ItemBuilder();

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
        case 'text':
          result.text = serializers.deserialize(value,
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
        case 'ups':
          result.ups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltMap<String, bool>);
          break;
        case 'downs':
          result.downs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltMap<String, bool>);
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Item
// **************************************************************************

class _$Item extends Item {
  @override
  final String uid;
  @override
  final String text;
  @override
  final String ownerUid;
  @override
  final String categoryUid;
  @override
  final BuiltMap<String, bool> ups;
  @override
  final BuiltMap<String, bool> downs;

  factory _$Item([void updates(ItemBuilder b)]) =>
      (new ItemBuilder()..update(updates)).build();

  _$Item._(
      {this.uid,
      this.text,
      this.ownerUid,
      this.categoryUid,
      this.ups,
      this.downs})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (text == null) throw new ArgumentError.notNull('text');
    if (ownerUid == null) throw new ArgumentError.notNull('ownerUid');
    if (categoryUid == null) throw new ArgumentError.notNull('categoryUid');
    if (ups == null) throw new ArgumentError.notNull('ups');
    if (downs == null) throw new ArgumentError.notNull('downs');
  }

  @override
  Item rebuild(void updates(ItemBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemBuilder toBuilder() => new ItemBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Item) return false;
    return uid == other.uid &&
        text == other.text &&
        ownerUid == other.ownerUid &&
        categoryUid == other.categoryUid &&
        ups == other.ups &&
        downs == other.downs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uid.hashCode), text.hashCode),
                    ownerUid.hashCode),
                categoryUid.hashCode),
            ups.hashCode),
        downs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Item')
          ..add('uid', uid)
          ..add('text', text)
          ..add('ownerUid', ownerUid)
          ..add('categoryUid', categoryUid)
          ..add('ups', ups)
          ..add('downs', downs))
        .toString();
  }
}

class ItemBuilder implements Builder<Item, ItemBuilder> {
  _$Item _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _ownerUid;
  String get ownerUid => _$this._ownerUid;
  set ownerUid(String ownerUid) => _$this._ownerUid = ownerUid;

  String _categoryUid;
  String get categoryUid => _$this._categoryUid;
  set categoryUid(String categoryUid) => _$this._categoryUid = categoryUid;

  MapBuilder<String, bool> _ups;
  MapBuilder<String, bool> get ups =>
      _$this._ups ??= new MapBuilder<String, bool>();
  set ups(MapBuilder<String, bool> ups) => _$this._ups = ups;

  MapBuilder<String, bool> _downs;
  MapBuilder<String, bool> get downs =>
      _$this._downs ??= new MapBuilder<String, bool>();
  set downs(MapBuilder<String, bool> downs) => _$this._downs = downs;

  ItemBuilder();

  ItemBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _text = _$v.text;
      _ownerUid = _$v.ownerUid;
      _categoryUid = _$v.categoryUid;
      _ups = _$v.ups?.toBuilder();
      _downs = _$v.downs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Item other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Item;
  }

  @override
  void update(void updates(ItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Item build() {
    final result = _$v ??
        new _$Item._(
            uid: uid,
            text: text,
            ownerUid: ownerUid,
            categoryUid: categoryUid,
            ups: ups?.build(),
            downs: downs?.build());
    replace(result);
    return result;
  }
}
