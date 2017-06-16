// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library user
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable serialize(Serializers serializers, User object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'boardUids',
      serializers.serialize(object.boardUids,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'boardUids':
          result.boardUids.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap<String, int>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class User
// **************************************************************************

class _$User extends User {
  @override
  final String uid;
  @override
  final BuiltMap<String, int> boardUids;
  @override
  final String name;

  factory _$User([void updates(UserBuilder b)]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.uid, this.boardUids, this.name}) : super._() {
    if (uid == null) throw new ArgumentError.notNull('uid');
    if (boardUids == null) throw new ArgumentError.notNull('boardUids');
    if (name == null) throw new ArgumentError.notNull('name');
  }

  @override
  User rebuild(void updates(UserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    return uid == other.uid &&
        boardUids == other.boardUids &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, uid.hashCode), boardUids.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('uid', uid)
          ..add('boardUids', boardUids)
          ..add('name', name))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  MapBuilder<String, int> _boardUids;
  MapBuilder<String, int> get boardUids =>
      _$this._boardUids ??= new MapBuilder<String, int>();
  set boardUids(MapBuilder<String, int> boardUids) =>
      _$this._boardUids = boardUids;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _boardUids = _$v.boardUids?.toBuilder();
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$User;
  }

  @override
  void update(void updates(UserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final result = _$v ??
        new _$User._(uid: uid, boardUids: boardUids?.build(), name: name);
    replace(result);
    return result;
  }
}
