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
  ActionDispatcher<Item> update;
  ActionDispatcher<String> remove;
  ActionDispatcher<String> setCurrent;

  ActionDispatcher<String> addSupport;
  ActionDispatcher<String> removeSupport;
  ActionDispatcher<String> hide;
  ActionDispatcher<String> show;

  // update text
  // add duration to time
  // vote for item
  // move to different category?
  // show / hide

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

  String get currentUid;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Items._();
  factory Items([updates(ItemsBuilder b)]) => new _$Items((ItemsBuilder b) => b..currentUid = "");

  @memoized
  Item get current => map[currentUid];

  @memoized
  BuiltList<Item> get visible => new BuiltList<Item>(map.values.where((value) => value.visible));
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Items, ItemsBuilder>()
      ..add<Item>(ItemsActionsNames.update, _updateItem)
      ..add<String>(ItemsActionsNames.setCurrent, _setCurrentItem))
    .build();

////////////////////
/// Reducers
///////////////////

_updateItem(Items state, Action<Item> action, ItemsBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_setCurrentItem(Items state, Action<String> action, ItemsBuilder builder) =>
    builder..currentUid = action.payload;
