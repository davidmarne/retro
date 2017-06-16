// GENERATED CODE - DO NOT MODIFY BY HAND

part of items;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class ItemsActions
// **************************************************************************

class _$ItemsActions extends ItemsActions {
  ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('ItemsActions-setCurrent');

  ActionDispatcher<Item> update =
      new ActionDispatcher<Item>('ItemsActions-update');
  factory _$ItemsActions() => new _$ItemsActions._();
  _$ItemsActions._() : super._();
  syncWithStore(dispatcher) {
    setCurrent.syncWithStore(dispatcher);
    update.syncWithStore(dispatcher);
  }
}

class ItemsActionsNames {
  static ActionName setCurrent =
      new ActionName<String>('ItemsActions-setCurrent');
  static ActionName update = new ActionName<Item>('ItemsActions-update');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Items
// **************************************************************************

class _$Items extends Items {
  @override
  final BuiltMap<String, Item> map;
  @override
  final String currentUid;
  Item __current;

  factory _$Items([void updates(ItemsBuilder b)]) =>
      (new ItemsBuilder()..update(updates)).build();

  _$Items._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  Item get current => __current ??= super.current;

  @override
  Items rebuild(void updates(ItemsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemsBuilder toBuilder() => new ItemsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Items) return false;
    return map == other.map && currentUid == other.currentUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Items')
          ..add('map', map)
          ..add('currentUid', currentUid))
        .toString();
  }
}

class ItemsBuilder implements Builder<Items, ItemsBuilder> {
  _$Items _$v;

  MapBuilder<String, Item> _map;
  MapBuilder<String, Item> get map =>
      _$this._map ??= new MapBuilder<String, Item>();
  set map(MapBuilder<String, Item> map) => _$this._map = map;

  String _currentUid;
  String get currentUid => _$this._currentUid;
  set currentUid(String currentUid) => _$this._currentUid = currentUid;

  ItemsBuilder();

  ItemsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentUid = _$v.currentUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Items other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Items;
  }

  @override
  void update(void updates(ItemsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Items build() {
    final result =
        _$v ?? new _$Items._(map: map?.build(), currentUid: currentUid);
    replace(result);
    return result;
  }
}
