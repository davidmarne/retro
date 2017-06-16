library categories;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/category.dart';

part 'categories.g.dart';

////////////////////
/// Actions
///////////////////

/// [CategoriesActions]
abstract class CategoriesActions extends ReduxActions {
  ActionDispatcher<Category> insertCategory;
  ActionDispatcher<Category> updateCategory;
    // update title
    // update description
  ActionDispatcher<Category> removeCategory;

  // factory to create on instance of the generated implementation of BoardsActions
  CategoriesActions._();
  factory CategoriesActions() => new _$CategoriesActions();
}

////////////////////
/// State
///////////////////

/// [Categories]
abstract class Categories extends BuiltReducer<Categories, CategoriesBuilder>
    implements Built<Categories, CategoriesBuilder> {
  /// [map] contains a map of category uid to Category.
  BuiltMap<String, Category> get map;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Categories._();
  factory Categories([updates(CategoriesBuilder b)]) => new _$Categories((CategoriesBuilder b) => b);
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Categories, CategoriesBuilder>()
      ..add<Category>(CategoriesActionsNames.insertCategory, _setCategory)
      ..add<Category>(CategoriesActionsNames.updateCategory, _setCategory)
      ..add<Category>(CategoriesActionsNames.removeCategory, _unsetCategory))
    .build();

////////////////////
/// Reducers
///////////////////

_setCategory(Categories state, Action<Category> action, CategoriesBuilder builder) =>
    builder..categoryMap[action.payload.uid] = action.payload;

_unsetCategory(Categories state, Action<Category> action, CategoriesBuilder builder) =>
    builder..categoryMap.remove(action.payload.uid);
