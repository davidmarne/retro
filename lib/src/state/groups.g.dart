// GENERATED CODE - DO NOT MODIFY BY HAND

part of groups;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class GroupsActions
// **************************************************************************

class _$GroupsActions extends GroupsActions {
  ActionDispatcher<String> setCurrentGroup =
      new ActionDispatcher<String>('GroupsActions-setCurrentGroup');

  ActionDispatcher<String> removeGroup =
      new ActionDispatcher<String>('GroupsActions-removeGroup');

  ActionDispatcher<Group> updateGroup =
      new ActionDispatcher<Group>('GroupsActions-updateGroup');
  factory _$GroupsActions() => new _$GroupsActions._();
  _$GroupsActions._() : super._();
  syncWithStore(dispatcher) {
    setCurrentGroup.syncWithStore(dispatcher);
    removeGroup.syncWithStore(dispatcher);
    updateGroup.syncWithStore(dispatcher);
  }
}

class GroupsActionsNames {
  static ActionName setCurrentGroup =
      new ActionName<String>('GroupsActions-setCurrentGroup');
  static ActionName removeGroup =
      new ActionName<String>('GroupsActions-removeGroup');
  static ActionName updateGroup =
      new ActionName<Group>('GroupsActions-updateGroup');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Groups
// **************************************************************************

class _$Groups extends Groups {
  @override
  final BuiltMap<String, Group> groupMap;
  @override
  final String currentGroupUid;
  Iterable<Group> __groups;
  Group __mostRecentGroup;
  Iterable<Group> __restOfGroups;
  Group __currentGroup;
  bool __currentGroupIsSet;

  factory _$Groups([void updates(GroupsBuilder b)]) =>
      (new GroupsBuilder()..update(updates)).build();

  _$Groups._({this.groupMap, this.currentGroupUid}) : super._() {
    if (groupMap == null) throw new ArgumentError.notNull('groupMap');
    if (currentGroupUid == null)
      throw new ArgumentError.notNull('currentGroupUid');
  }

  @override
  Iterable<Group> get groups => __groups ??= super.groups;

  @override
  Group get mostRecentGroup => __mostRecentGroup ??= super.mostRecentGroup;

  @override
  Iterable<Group> get restOfGroups => __restOfGroups ??= super.restOfGroups;

  @override
  Group get currentGroup => __currentGroup ??= super.currentGroup;

  @override
  bool get currentGroupIsSet => __currentGroupIsSet ??= super.currentGroupIsSet;

  @override
  Groups rebuild(void updates(GroupsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupsBuilder toBuilder() => new GroupsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Groups) return false;
    return groupMap == other.groupMap &&
        currentGroupUid == other.currentGroupUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, groupMap.hashCode), currentGroupUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Groups')
          ..add('groupMap', groupMap)
          ..add('currentGroupUid', currentGroupUid))
        .toString();
  }
}

class GroupsBuilder implements Builder<Groups, GroupsBuilder> {
  _$Groups _$v;

  MapBuilder<String, Group> _groupMap;
  MapBuilder<String, Group> get groupMap =>
      _$this._groupMap ??= new MapBuilder<String, Group>();
  set groupMap(MapBuilder<String, Group> groupMap) =>
      _$this._groupMap = groupMap;

  String _currentGroupUid;
  String get currentGroupUid => _$this._currentGroupUid;
  set currentGroupUid(String currentGroupUid) =>
      _$this._currentGroupUid = currentGroupUid;

  GroupsBuilder();

  GroupsBuilder get _$this {
    if (_$v != null) {
      _groupMap = _$v.groupMap?.toBuilder();
      _currentGroupUid = _$v.currentGroupUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Groups other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Groups;
  }

  @override
  void update(void updates(GroupsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Groups build() {
    final result = _$v ??
        new _$Groups._(
            groupMap: groupMap?.build(), currentGroupUid: currentGroupUid);
    replace(result);
    return result;
  }
}
