// GENERATED CODE - DO NOT MODIFY BY HAND

part of items;

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

class _$Items extends Items {
  @override
  final BuiltMap<String, Item> map;
  @override
  final String currentUid;
  Item __current;
  BuiltList<Item> __visible;

  factory _$Items([void updates(ItemsBuilder b)]) =>
      (new ItemsBuilder()..update(updates)).build();

  _$Items._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  Item get current => __current ??= super.current;

  @override
  BuiltList<Item> get visible => __visible ??= super.visible;

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
    final _$result =
        _$v ?? new _$Items._(map: map?.build(), currentUid: currentUid);
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$ItemsActions extends ItemsActions {
  final ActionDispatcher<String> show =
      new ActionDispatcher<String>('ItemsActions-show');

  final ActionDispatcher<String> hide =
      new ActionDispatcher<String>('ItemsActions-hide');

  final ActionDispatcher<String> removeSupport =
      new ActionDispatcher<String>('ItemsActions-removeSupport');

  final ActionDispatcher<String> addSupport =
      new ActionDispatcher<String>('ItemsActions-addSupport');

  final ActionDispatcher<String> editText =
      new ActionDispatcher<String>('ItemsActions-editText');

  final ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('ItemsActions-setCurrent');

  final ActionDispatcher<String> remove =
      new ActionDispatcher<String>('ItemsActions-remove');

  final ActionDispatcher<Item> update =
      new ActionDispatcher<Item>('ItemsActions-update');
  factory _$ItemsActions() => new _$ItemsActions._();

  _$ItemsActions._() : super._();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    show.setDispatcher(dispatcher);
    hide.setDispatcher(dispatcher);
    removeSupport.setDispatcher(dispatcher);
    addSupport.setDispatcher(dispatcher);
    editText.setDispatcher(dispatcher);
    setCurrent.setDispatcher(dispatcher);
    remove.setDispatcher(dispatcher);
    update.setDispatcher(dispatcher);
  }
}

class ItemsActionsNames {
  static final ActionName<String> show =
      new ActionName<String>('ItemsActions-show');
  static final ActionName<String> hide =
      new ActionName<String>('ItemsActions-hide');
  static final ActionName<String> removeSupport =
      new ActionName<String>('ItemsActions-removeSupport');
  static final ActionName<String> addSupport =
      new ActionName<String>('ItemsActions-addSupport');
  static final ActionName<String> editText =
      new ActionName<String>('ItemsActions-editText');
  static final ActionName<String> setCurrent =
      new ActionName<String>('ItemsActions-setCurrent');
  static final ActionName<String> remove =
      new ActionName<String>('ItemsActions-remove');
  static final ActionName<Item> update =
      new ActionName<Item>('ItemsActions-update');
}
