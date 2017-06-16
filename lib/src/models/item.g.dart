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
      'boardUid',
      serializers.serialize(object.boardUid,
          specifiedType: const FullType(String)),
      'sessionUid',
      serializers.serialize(object.sessionUid,
          specifiedType: const FullType(String)),
      'categoryUid',
      serializers.serialize(object.categoryUid,
          specifiedType: const FullType(String)),
      'ownerUid',
      serializers.serialize(object.ownerUid,
          specifiedType: const FullType(String)),
      'supporterUids',
      serializers.serialize(object.supporterUids,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(String)])),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(int)),
      'visible',
      serializers.serialize(object.visible,
          specifiedType: const FullType(bool)),
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
        case 'boardUid':
          result.boardUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sessionUid':
          result.sessionUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryUid':
          result.categoryUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownerUid':
          result.ownerUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'supporterUids':
          result.supporterUids.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(String)
              ])) as BuiltMap<String, String>);
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Item
// **************************************************************************

class _$Item extends Item {
  @override
  final String uid;
  @override
  final String boardUid;
  @override
  final String sessionUid;
  @override
  final String categoryUid;
  @override
  final String ownerUid;
  @override
  final BuiltMap<String, String> supporterUids;
  @override
  final String text;
  @override
  final int time;
  @override
  final bool visible;

  factory _$Item([void updates(ItemBuilder b)]) =>
      (new ItemBuilder()..update(updates)).build();

  _$Item._(
      {this.uid,
      this.boardUid,
      this.sessionUid,
      this.categoryUid,
      this.ownerUid,
      this.supporterUids,
      this.text,
      this.time,
      this.visible})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUid == null) throw new ArgumentError.notNull('boardUid');
    if (sessionUid == null) throw new ArgumentError.notNull('sessionUid');
    if (categoryUid == null) throw new ArgumentError.notNull('categoryUid');
    if (ownerUid == null) throw new ArgumentError.notNull('ownerUid');
    if (supporterUids == null) throw new ArgumentError.notNull('supporterUids');
    if (text == null) throw new ArgumentError.notNull('text');
    if (time == null) throw new ArgumentError.notNull('time');
    if (visible == null) throw new ArgumentError.notNull('visible');
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
        boardUid == other.boardUid &&
        sessionUid == other.sessionUid &&
        categoryUid == other.categoryUid &&
        ownerUid == other.ownerUid &&
        supporterUids == other.supporterUids &&
        text == other.text &&
        time == other.time &&
        visible == other.visible;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), boardUid.hashCode),
                                sessionUid.hashCode),
                            categoryUid.hashCode),
                        ownerUid.hashCode),
                    supporterUids.hashCode),
                text.hashCode),
            time.hashCode),
        visible.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Item')
          ..add('uid', uid)
          ..add('boardUid', boardUid)
          ..add('sessionUid', sessionUid)
          ..add('categoryUid', categoryUid)
          ..add('ownerUid', ownerUid)
          ..add('supporterUids', supporterUids)
          ..add('text', text)
          ..add('time', time)
          ..add('visible', visible))
        .toString();
  }
}

class ItemBuilder implements Builder<Item, ItemBuilder> {
  _$Item _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _boardUid;
  String get boardUid => _$this._boardUid;
  set boardUid(String boardUid) => _$this._boardUid = boardUid;

  String _sessionUid;
  String get sessionUid => _$this._sessionUid;
  set sessionUid(String sessionUid) => _$this._sessionUid = sessionUid;

  String _categoryUid;
  String get categoryUid => _$this._categoryUid;
  set categoryUid(String categoryUid) => _$this._categoryUid = categoryUid;

  String _ownerUid;
  String get ownerUid => _$this._ownerUid;
  set ownerUid(String ownerUid) => _$this._ownerUid = ownerUid;

  MapBuilder<String, String> _supporterUids;
  MapBuilder<String, String> get supporterUids =>
      _$this._supporterUids ??= new MapBuilder<String, String>();
  set supporterUids(MapBuilder<String, String> supporterUids) =>
      _$this._supporterUids = supporterUids;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  bool _visible;
  bool get visible => _$this._visible;
  set visible(bool visible) => _$this._visible = visible;

  ItemBuilder();

  ItemBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUid = _$v.boardUid;
      _sessionUid = _$v.sessionUid;
      _categoryUid = _$v.categoryUid;
      _ownerUid = _$v.ownerUid;
      _supporterUids = _$v.supporterUids?.toBuilder();
      _text = _$v.text;
      _time = _$v.time;
      _visible = _$v.visible;
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
            boardUid: boardUid,
            sessionUid: sessionUid,
            categoryUid: categoryUid,
            ownerUid: ownerUid,
            supporterUids: supporterUids?.build(),
            text: text,
            time: time,
            visible: visible);
    replace(result);
    return result;
  }
}
