library items;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/item.dart';

part 'items.g.dart';

////////////////////
/// Actions
///////////////////

/// [ItemsActions]
abstract class ItemsActions extends ReduxActions {
  ActionDispatcher<Item> insertItem;
  ActionDispatcher<Item> updateItem;
    // update text
    // add duration to time
    // vote for item
    // move to different category?
    // show / hide
  ActionDispatcher<Item> removeItem;

  // factory to create on instance of the generated implementation of BoardsActions
  ItemsActions._();
  factory ItemsActions() => new _$ItemsActions();
}

////////////////////
/// State
///////////////////

/// [Items]
abstract class Items extends BuiltReducer<Items, ItemsBuilder>
    implements Built<Items, ItemsBuilder> {
  /// [map] contains a map of Item uid to Item.
  BuiltMap<String, Item> get map;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Items._();
  factory Items([updates(ItemsBuilder b)]) => new _$Items((ItemsBuilder b) => b);
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Items, ItemsBuilder>()
      ..add<Item>(ItemsActionsNames.insertItem, _setItem)
      ..add<Item>(ItemsActionsNames.updateItem, _setItem)
      ..add<Item>(ItemsActionsNames.removeItem, _unsetItem))
    .build();

////////////////////
/// Reducers
///////////////////

_setItem(Items state, Action<Item> action, ItemsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_unsetItem(Items state, Action<Item> action, ItemsBuilder builder) =>
    builder..map.remove(action.payload.uid);
