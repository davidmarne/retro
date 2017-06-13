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
      'groupUid',
      serializers.serialize(object.groupUid,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'startDate',
      serializers.serialize(object.startDate,
          specifiedType: const FullType(int)),
      'endDate',
      serializers.serialize(object.endDate, specifiedType: const FullType(int)),
      'categories',
      serializers.serialize(object.categories,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(Category)])),
      'items',
      serializers.serialize(object.items,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(Item)])),
      'notes',
      serializers.serialize(object.notes,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(Note)])),
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
        case 'groupUid':
          result.groupUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Category)
              ])) as BuiltMap<String, Category>);
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Item)
              ])) as BuiltMap<String, Item>);
          break;
        case 'notes':
          result.notes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Note)
              ])) as BuiltMap<String, Note>);
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
  final String groupUid;
  @override
  final String displayName;
  @override
  final String description;
  @override
  final int startDate;
  @override
  final int endDate;
  @override
  final BuiltMap<String, Category> categories;
  @override
  final BuiltMap<String, Item> items;
  @override
  final BuiltMap<String, Note> notes;
  String __startDateStr;
  String __endDateStr;

  factory _$Board([void updates(BoardBuilder b)]) =>
      (new BoardBuilder()..update(updates)).build();

  _$Board._(
      {this.uid,
      this.groupUid,
      this.displayName,
      this.description,
      this.startDate,
      this.endDate,
      this.categories,
      this.items,
      this.notes})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (groupUid == null) throw new ArgumentError.notNull('groupUid');
    if (displayName == null) throw new ArgumentError.notNull('displayName');
    if (description == null) throw new ArgumentError.notNull('description');
    if (startDate == null) throw new ArgumentError.notNull('startDate');
    if (endDate == null) throw new ArgumentError.notNull('endDate');
    if (categories == null) throw new ArgumentError.notNull('categories');
    if (items == null) throw new ArgumentError.notNull('items');
    if (notes == null) throw new ArgumentError.notNull('notes');
  }

  @override
  String get startDateStr => __startDateStr ??= super.startDateStr;

  @override
  String get endDateStr => __endDateStr ??= super.endDateStr;

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
        groupUid == other.groupUid &&
        displayName == other.displayName &&
        description == other.description &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        categories == other.categories &&
        items == other.items &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), groupUid.hashCode),
                                displayName.hashCode),
                            description.hashCode),
                        startDate.hashCode),
                    endDate.hashCode),
                categories.hashCode),
            items.hashCode),
        notes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Board')
          ..add('uid', uid)
          ..add('groupUid', groupUid)
          ..add('displayName', displayName)
          ..add('description', description)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('categories', categories)
          ..add('items', items)
          ..add('notes', notes))
        .toString();
  }
}

class BoardBuilder implements Builder<Board, BoardBuilder> {
  _$Board _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _groupUid;
  String get groupUid => _$this._groupUid;
  set groupUid(String groupUid) => _$this._groupUid = groupUid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _startDate;
  int get startDate => _$this._startDate;
  set startDate(int startDate) => _$this._startDate = startDate;

  int _endDate;
  int get endDate => _$this._endDate;
  set endDate(int endDate) => _$this._endDate = endDate;

  MapBuilder<String, Category> _categories;
  MapBuilder<String, Category> get categories =>
      _$this._categories ??= new MapBuilder<String, Category>();
  set categories(MapBuilder<String, Category> categories) =>
      _$this._categories = categories;

  MapBuilder<String, Item> _items;
  MapBuilder<String, Item> get items =>
      _$this._items ??= new MapBuilder<String, Item>();
  set items(MapBuilder<String, Item> items) => _$this._items = items;

  MapBuilder<String, Note> _notes;
  MapBuilder<String, Note> get notes =>
      _$this._notes ??= new MapBuilder<String, Note>();
  set notes(MapBuilder<String, Note> notes) => _$this._notes = notes;

  BoardBuilder();

  BoardBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _groupUid = _$v.groupUid;
      _displayName = _$v.displayName;
      _description = _$v.description;
      _startDate = _$v.startDate;
      _endDate = _$v.endDate;
      _categories = _$v.categories?.toBuilder();
      _items = _$v.items?.toBuilder();
      _notes = _$v.notes?.toBuilder();
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
            groupUid: groupUid,
            displayName: displayName,
            description: description,
            startDate: startDate,
            endDate: endDate,
            categories: categories?.build(),
            items: items?.build(),
            notes: notes?.build());
    replace(result);
    return result;
  }
}
