library groups;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/group.dart';

part 'groups.g.dart';

////////////////////
/// Actions
///////////////////

/// [GroupsActions]
abstract class GroupsActions extends ReduxActions {
  ActionDispatcher<Group> updateGroup;
  ActionDispatcher<String> removeGroup;
  ActionDispatcher<String> setCurrentGroup;

  // factory to create on instance of the generated implementation of GroupsActions
  GroupsActions._();
  factory GroupsActions() => new _$GroupsActions();
}

////////////////////
/// State
///////////////////

/// [Groups]
abstract class Groups extends BuiltReducer<Groups, GroupsBuilder>
    implements Built<Groups, GroupsBuilder> {
  /// [groupMap] contains a map of group.id to Group
  BuiltMap<String, Group> get groupMap;

  String get currentGroupUid;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Groups._();
  factory Groups([updates(GroupsBuilder b)]) =>
      new _$Groups((GroupsBuilder b) => b..currentGroupUid = "");

  @memoized
  Iterable<Group> get groups => groupMap.values;

  @memoized
  Group get mostRecentGroup => groups.length > 0 ? groups.first : null;

  @memoized
  Iterable<Group> get restOfGroups => groups.length > 1 ? groups.skip(1) : [];

  @memoized
  Group get currentGroup => groupMap[currentGroupUid];

  @memoized
  bool get currentGroupIsSet => currentGroupUid != "";
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Groups, GroupsBuilder>()
      ..add<Group>(GroupsActionsNames.updateGroup, _updateGroup)
      ..add<String>(GroupsActionsNames.removeGroup, _removeGroup)
      ..add<String>(GroupsActionsNames.setCurrentGroup, _setCurrentGroup))
    .build();

////////////////////
/// Reducers
///////////////////

_updateGroup(Groups state, Action<Group> action, GroupsBuilder builder) =>
    builder..groupMap[action.payload.uid] = action.payload;

_removeGroup(Groups state, Action<String> action, GroupsBuilder builder) =>
    builder..groupMap.remove(action.payload);

_setCurrentGroup(Groups state, Action<String> action, GroupsBuilder builder) =>
    builder..currentGroupUid = action.payload;
