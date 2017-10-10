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
  ActionDispatcher<Category> update;
  ActionDispatcher<String> remove;
  ActionDispatcher<String> setCurrent;
  // update title
  // update description
  // show / hide
  ActionDispatcher<String> hide;
  ActionDispatcher<String> show;

  // factory to create on instance of the generated implementation of BoardsActions
  CategoriesActions._();
  factory CategoriesActions() => new _$CategoriesActions();
}

////////////////////
/// State
///////////////////

/// [Categories]
abstract class Categories extends ReducerBuilder<Categories, CategoriesBuilder>
    implements Built<Categories, CategoriesBuilder> {
  /// [map] contains a map of category uid to Category.
  BuiltMap<String, Category> get map;

  String get currentUid;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Categories._();
  factory Categories([updates(CategoriesBuilder b)]) =>
      new _$Categories((CategoriesBuilder b) => b..currentUid = "");

  @memoized
  Category get current => map[currentUid];

  @memoized
  BuiltList<Category> get visible => new BuiltList<Category>(map.values.where((value) => value.visible));
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Categories, CategoriesBuilder>()
      ..add<Category>(CategoriesActionsNames.update, _updateCategory)
      ..add<String>(CategoriesActionsNames.remove, _removeCategory)
      ..add<String>(CategoriesActionsNames.setCurrent, _setCurrentItem))
    .build();

////////////////////
/// Reducers
///////////////////

_updateCategory(Categories state, Action<Category> action, CategoriesBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_removeCategory(Categories state, Action<String> action, CategoriesBuilder builder) =>
    builder..map.remove(action.payload);

_setCurrentItem(Categories state, Action<String> action, CategoriesBuilder builder) =>
    builder..currentUid = action.payload;
