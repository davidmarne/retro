// GENERATED CODE - DO NOT MODIFY BY HAND

part of items;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class ItemsActions
// **************************************************************************

class _$ItemsActions extends ItemsActions {
  ActionDispatcher<Item> removeItem =
      new ActionDispatcher<Item>('ItemsActions-removeItem');

  ActionDispatcher<Item> updateItem =
      new ActionDispatcher<Item>('ItemsActions-updateItem');

  ActionDispatcher<Item> insertItem =
      new ActionDispatcher<Item>('ItemsActions-insertItem');
  factory _$ItemsActions() => new _$ItemsActions._();
  _$ItemsActions._() : super._();
  syncWithStore(dispatcher) {
    removeItem.syncWithStore(dispatcher);
    updateItem.syncWithStore(dispatcher);
    insertItem.syncWithStore(dispatcher);
  }
}

class ItemsActionsNames {
  static ActionName removeItem =
      new ActionName<Item>('ItemsActions-removeItem');
  static ActionName updateItem =
      new ActionName<Item>('ItemsActions-updateItem');
  static ActionName insertItem =
      new ActionName<Item>('ItemsActions-insertItem');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Items
// **************************************************************************

class _$Items extends Items {
  @override
  final BuiltMap<String, Item> map;

  factory _$Items([void updates(ItemsBuilder b)]) =>
      (new ItemsBuilder()..update(updates)).build();

  _$Items._({this.map}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  Items rebuild(void updates(ItemsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemsBuilder toBuilder() => new ItemsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Items) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Items')..add('map', map)).toString();
  }
}

class ItemsBuilder implements Builder<Items, ItemsBuilder> {
  _$Items _$v;

  MapBuilder<String, Item> _map;
  MapBuilder<String, Item> get map =>
      _$this._map ??= new MapBuilder<String, Item>();
  set map(MapBuilder<String, Item> map) => _$this._map = map;

  ItemsBuilder();

  ItemsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
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
    final result = _$v ?? new _$Items._(map: map?.build());
    replace(result);
    return result;
  }
}
