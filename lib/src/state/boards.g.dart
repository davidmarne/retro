// GENERATED CODE - DO NOT MODIFY BY HAND

part of boards;

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

class _$Boards extends Boards {
  @override
  final BuiltMap<String, Board> map;
  @override
  final String currentUid;
  Board __current;

  factory _$Boards([void updates(BoardsBuilder b)]) =>
      (new BoardsBuilder()..update(updates)).build();

  _$Boards._({this.map, this.currentUid}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
    if (currentUid == null) throw new ArgumentError.notNull('currentUid');
  }

  @override
  Board get current => __current ??= super.current;

  @override
  Boards rebuild(void updates(BoardsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardsBuilder toBuilder() => new BoardsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Boards) return false;
    return map == other.map && currentUid == other.currentUid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, map.hashCode), currentUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Boards')
          ..add('map', map)
          ..add('currentUid', currentUid))
        .toString();
  }
}

class BoardsBuilder implements Builder<Boards, BoardsBuilder> {
  _$Boards _$v;

  MapBuilder<String, Board> _map;
  MapBuilder<String, Board> get map =>
      _$this._map ??= new MapBuilder<String, Board>();
  set map(MapBuilder<String, Board> map) => _$this._map = map;

  String _currentUid;
  String get currentUid => _$this._currentUid;
  set currentUid(String currentUid) => _$this._currentUid = currentUid;

  BoardsBuilder();

  BoardsBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _currentUid = _$v.currentUid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Boards other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Boards;
  }

  @override
  void update(void updates(BoardsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Boards build() {
    final _$result =
        _$v ?? new _$Boards._(map: map?.build(), currentUid: currentUid);
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$BoardsActions extends BoardsActions {
  final ActionDispatcher<Null> shred =
      new ActionDispatcher<Null>('BoardsActions-shred');

  final ActionDispatcher<String> setCurrent =
      new ActionDispatcher<String>('BoardsActions-setCurrent');

  final ActionDispatcher<String> remove =
      new ActionDispatcher<String>('BoardsActions-remove');

  final ActionDispatcher<Board> update =
      new ActionDispatcher<Board>('BoardsActions-update');
  factory _$BoardsActions() => new _$BoardsActions._();

  _$BoardsActions._() : super._();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    shred.setDispatcher(dispatcher);
    setCurrent.setDispatcher(dispatcher);
    remove.setDispatcher(dispatcher);
    update.setDispatcher(dispatcher);
  }
}

class BoardsActionsNames {
  static final ActionName<Null> shred =
      new ActionName<Null>('BoardsActions-shred');
  static final ActionName<String> setCurrent =
      new ActionName<String>('BoardsActions-setCurrent');
  static final ActionName<String> remove =
      new ActionName<String>('BoardsActions-remove');
  static final ActionName<Board> update =
      new ActionName<Board>('BoardsActions-update');
}
