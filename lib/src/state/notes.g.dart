// GENERATED CODE - DO NOT MODIFY BY HAND

part of notes;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class NotesActions
// **************************************************************************

class _$NotesActions extends NotesActions {
  ActionDispatcher<bool> setVisibility =
      new ActionDispatcher<bool>('NotesActions-setVisibility');

  ActionDispatcher<String> remove =
      new ActionDispatcher<String>('NotesActions-remove');

  ActionDispatcher<Note> update =
      new ActionDispatcher<Note>('NotesActions-update');
  factory _$NotesActions() => new _$NotesActions._();
  _$NotesActions._() : super._();
  syncWithStore(dispatcher) {
    setVisibility.syncWithStore(dispatcher);
    remove.syncWithStore(dispatcher);
    update.syncWithStore(dispatcher);
  }
}

class NotesActionsNames {
  static ActionName setVisibility =
      new ActionName<bool>('NotesActions-setVisibility');
  static ActionName remove = new ActionName<String>('NotesActions-remove');
  static ActionName update = new ActionName<Note>('NotesActions-update');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Notes
// **************************************************************************

class _$Notes extends Notes {
  @override
  final BuiltMap<String, Note> map;
  BuiltList<Note> __visible;

  factory _$Notes([void updates(NotesBuilder b)]) =>
      (new NotesBuilder()..update(updates)).build();

  _$Notes._({this.map}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  BuiltList<Note> get visible => __visible ??= super.visible;

  @override
  Notes rebuild(void updates(NotesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesBuilder toBuilder() => new NotesBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Notes) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Notes')..add('map', map)).toString();
  }
}

class NotesBuilder implements Builder<Notes, NotesBuilder> {
  _$Notes _$v;

  MapBuilder<String, Note> _map;
  MapBuilder<String, Note> get map =>
      _$this._map ??= new MapBuilder<String, Note>();
  set map(MapBuilder<String, Note> map) => _$this._map = map;

  NotesBuilder();

  NotesBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Notes other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Notes;
  }

  @override
  void update(void updates(NotesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Notes build() {
    final result = _$v ?? new _$Notes._(map: map?.build());
    replace(result);
    return result;
  }
}
