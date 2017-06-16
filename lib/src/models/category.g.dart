// GENERATED CODE - DO NOT MODIFY BY HAND

part of category;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library category
// **************************************************************************

Serializer<Category> _$categorySerializer = new _$CategorySerializer();

class _$CategorySerializer implements StructuredSerializer<Category> {
  @override
  final Iterable<Type> types = const [Category, _$Category];
  @override
  final String wireName = 'Category';

  @override
  Iterable serialize(Serializers serializers, Category object,
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
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'visible',
      serializers.serialize(object.visible,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Category deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CategoryBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
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

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Category
// **************************************************************************

class _$Category extends Category {
  @override
  final String uid;
  @override
  final String boardUid;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool visible;

  factory _$Category([void updates(CategoryBuilder b)]) =>
      (new CategoryBuilder()..update(updates)).build();

  _$Category._(
      {this.uid, this.boardUid, this.title, this.description, this.visible})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUid == null) throw new ArgumentError.notNull('boardUid');
    if (title == null) throw new ArgumentError.notNull('title');
    if (description == null) throw new ArgumentError.notNull('description');
    if (visible == null) throw new ArgumentError.notNull('visible');
  }

  @override
  Category rebuild(void updates(CategoryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => new CategoryBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Category) return false;
    return uid == other.uid &&
        boardUid == other.boardUid &&
        title == other.title &&
        description == other.description &&
        visible == other.visible;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, uid.hashCode), boardUid.hashCode), title.hashCode),
            description.hashCode),
        visible.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Category')
          ..add('uid', uid)
          ..add('boardUid', boardUid)
          ..add('title', title)
          ..add('description', description)
          ..add('visible', visible))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder> {
  _$Category _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _boardUid;
  String get boardUid => _$this._boardUid;
  set boardUid(String boardUid) => _$this._boardUid = boardUid;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _visible;
  bool get visible => _$this._visible;
  set visible(bool visible) => _$this._visible = visible;

  CategoryBuilder();

  CategoryBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUid = _$v.boardUid;
      _title = _$v.title;
      _description = _$v.description;
      _visible = _$v.visible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Category other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Category;
  }

  @override
  void update(void updates(CategoryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Category build() {
    final result = _$v ??
        new _$Category._(
            uid: uid,
            boardUid: boardUid,
            title: title,
            description: description,
            visible: visible);
    replace(result);
    return result;
  }
}
