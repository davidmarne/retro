// GENERATED CODE - DO NOT MODIFY BY HAND

part of categories;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class CategoriesActions
// **************************************************************************

class _$CategoriesActions extends CategoriesActions {
  ActionDispatcher<Category> removeCategory =
      new ActionDispatcher<Category>('CategoriesActions-removeCategory');

  ActionDispatcher<Category> updateCategory =
      new ActionDispatcher<Category>('CategoriesActions-updateCategory');

  ActionDispatcher<Category> insertCategory =
      new ActionDispatcher<Category>('CategoriesActions-insertCategory');
  factory _$CategoriesActions() => new _$CategoriesActions._();
  _$CategoriesActions._() : super._();
  syncWithStore(dispatcher) {
    removeCategory.syncWithStore(dispatcher);
    updateCategory.syncWithStore(dispatcher);
    insertCategory.syncWithStore(dispatcher);
  }
}

class CategoriesActionsNames {
  static ActionName removeCategory =
      new ActionName<Category>('CategoriesActions-removeCategory');
  static ActionName updateCategory =
      new ActionName<Category>('CategoriesActions-updateCategory');
  static ActionName insertCategory =
      new ActionName<Category>('CategoriesActions-insertCategory');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Categories
// **************************************************************************

class _$Categories extends Categories {
  @override
  final BuiltMap<String, Category> map;

  factory _$Categories([void updates(CategoriesBuilder b)]) =>
      (new CategoriesBuilder()..update(updates)).build();

  _$Categories._({this.map}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  Categories rebuild(void updates(CategoriesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesBuilder toBuilder() => new CategoriesBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Categories) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Categories')..add('map', map))
        .toString();
  }
}

class CategoriesBuilder implements Builder<Categories, CategoriesBuilder> {
  _$Categories _$v;

  MapBuilder<String, Category> _map;
  MapBuilder<String, Category> get map =>
      _$this._map ??= new MapBuilder<String, Category>();
  set map(MapBuilder<String, Category> map) => _$this._map = map;

  CategoriesBuilder();

  CategoriesBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
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
    final result = _$v ?? new _$Categories._(map: map?.build());
    replace(result);
    return result;
  }
}
