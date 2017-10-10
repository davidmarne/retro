// GENERATED CODE - DO NOT MODIFY BY HAND

part of categories;

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

class _$Categories extends Categories {
  @override
  final BuiltMap<String, Category> map;
  @override
  final String currentUid;
  Category __current;
  BuiltList<Category> __visible;

  factory _$Categories([void updates(CategoriesBuilder b)]) =>
      (new CategoriesBuilder()..update(updates)).build();

  _$Categories._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  Category get current => __current ??= super.current;

  @override
  BuiltList<Category> get visible => __visible ??= super.visible;

  @override
  Categories rebuild(void updates(CategoriesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesBuilder toBuilder() => new CategoriesBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Categories) return false;
    return map == other.map && currentUid == other.currentUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Categories')
          ..add('map', map)
          ..add('currentUid', currentUid))
        .toString();
  }
}

class CategoriesBuilder implements Builder<Categories, CategoriesBuilder> {
  _$Categories _$v;

  MapBuilder<String, Category> _map;
  MapBuilder<String, Category> get map =>
      _$this._map ??= new MapBuilder<String, Category>();
  set map(MapBuilder<String, Category> map) => _$this._map = map;

  String _currentUid;
  String get currentUid => _$this._currentUid;
  set currentUid(String currentUid) => _$this._currentUid = currentUid;

  CategoriesBuilder();

  CategoriesBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentUid = _$v.currentUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Categories other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Categories;
  }

  @override
  void update(void updates(CategoriesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Categories build() {
    final _$result =
        _$v ?? new _$Categories._(map: map?.build(), currentUid: currentUid);
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$CategoriesActions extends CategoriesActions {
  final ActionDispatcher<String> show =
      new ActionDispatcher<String>('CategoriesActions-show');

  final ActionDispatcher<String> hide =
      new ActionDispatcher<String>('CategoriesActions-hide');

  final ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('CategoriesActions-setCurrent');

  final ActionDispatcher<String> remove =
      new ActionDispatcher<String>('CategoriesActions-remove');

  final ActionDispatcher<Category> update =
      new ActionDispatcher<Category>('CategoriesActions-update');
  factory _$CategoriesActions() => new _$CategoriesActions._();

  _$CategoriesActions._() : super._();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    show.setDispatcher(dispatcher);
    hide.setDispatcher(dispatcher);
    setCurrent.setDispatcher(dispatcher);
    remove.setDispatcher(dispatcher);
    update.setDispatcher(dispatcher);
  }
}

class CategoriesActionsNames {
  static final ActionName<String> show =
      new ActionName<String>('CategoriesActions-show');
  static final ActionName<String> hide =
      new ActionName<String>('CategoriesActions-hide');
  static final ActionName<String> setCurrent =
      new ActionName<String>('CategoriesActions-setCurrent');
  static final ActionName<String> remove =
      new ActionName<String>('CategoriesActions-remove');
  static final ActionName<Category> update =
      new ActionName<Category>('CategoriesActions-update');
}
