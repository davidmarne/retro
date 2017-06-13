// GENERATED CODE - DO NOT MODIFY BY HAND

part of group;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library group
// **************************************************************************

Serializer<Group> _$groupSerializer = new _$GroupSerializer();

class _$GroupSerializer implements StructuredSerializer<Group> {
  @override
  final Iterable<Type> types = const [Group, _$Group];
  @override
  final String wireName = 'Group';

  @override
  Iterable serialize(Serializers serializers, Group object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'boards',
      serializers.serialize(object.boards,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)])),
      'users',
      serializers.serialize(object.users,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)])),
    ];

    return result;
  }

  @override
  Group deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new GroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'boards':
          result.boards.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltMap<String, bool>);
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltMap<String, bool>);
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Group
// **************************************************************************

class _$Group extends Group {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String description;
  @override
  final BuiltMap<String, bool> boards;
  @override
  final BuiltMap<String, bool> users;

  factory _$Group([void updates(GroupBuilder b)]) =>
      (new GroupBuilder()..update(updates)).build();

  _$Group._(
      {this.uid, this.displayName, this.description, this.boards, this.users})
      : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (displayName == null) throw new ArgumentError.notNull('displayName');
    if (description == null) throw new ArgumentError.notNull('description');
    if (boards == null) throw new ArgumentError.notNull('boards');
    if (users == null) throw new ArgumentError.notNull('users');
  }

  @override
  Group rebuild(void updates(GroupBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupBuilder toBuilder() => new GroupBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Group) return false;
    return uid == other.uid &&
        displayName == other.displayName &&
        description == other.description &&
        boards == other.boards &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), displayName.hashCode),
                description.hashCode),
            boards.hashCode),
        users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Group')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('description', description)
          ..add('boards', boards)
          ..add('users', users))
        .toString();
  }
}

class GroupBuilder implements Builder<Group, GroupBuilder> {
  _$Group _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  MapBuilder<String, bool> _boards;
  MapBuilder<String, bool> get boards =>
      _$this._boards ??= new MapBuilder<String, bool>();
  set boards(MapBuilder<String, bool> boards) => _$this._boards = boards;

  MapBuilder<String, bool> _users;
  MapBuilder<String, bool> get users =>
      _$this._users ??= new MapBuilder<String, bool>();
  set users(MapBuilder<String, bool> users) => _$this._users = users;

  GroupBuilder();

  GroupBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _description = _$v.description;
      _boards = _$v.boards?.toBuilder();
      _users = _$v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Group other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Group;
  }

  @override
  void update(void updates(GroupBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Group build() {
    final result = _$v ??
        new _$Group._(
            uid: uid,
            displayName: displayName,
            description: description,
            boards: boards?.build(),
            users: users?.build());
    replace(result);
    return result;
  }
}
