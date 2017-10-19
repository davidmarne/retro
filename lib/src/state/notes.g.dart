// GENERATED CODE - DO NOT MODIFY BY HAND

part of notes;

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
    final _$result = _$v ?? new _$Notes._(map: map?.build());
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$NotesActions extends NotesActions {
  final ActionDispatcher<String> show =
      new ActionDispatcher<String>('NotesActions-show');

  final ActionDispatcher<String> hide =
      new ActionDispatcher<String>('NotesActions-hide');

  final ActionDispatcher<PairNotePayload> unpair =
      new ActionDispatcher<PairNotePayload>('NotesActions-unpair');

  final ActionDispatcher<PairNotePayload> pair =
      new ActionDispatcher<PairNotePayload>('NotesActions-pair');

  final ActionDispatcher<String> remove =
      new ActionDispatcher<String>('NotesActions-remove');

  final ActionDispatcher<Note> update =
      new ActionDispatcher<Note>('NotesActions-update');
  factory _$NotesActions() => new _$NotesActions._();

  _$NotesActions._() : super._();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    show.setDispatcher(dispatcher);
    hide.setDispatcher(dispatcher);
    unpair.setDispatcher(dispatcher);
    pair.setDispatcher(dispatcher);
    remove.setDispatcher(dispatcher);
    update.setDispatcher(dispatcher);
  }
}

class NotesActionsNames {
  static final ActionName<String> show =
      new ActionName<String>('NotesActions-show');
  static final ActionName<String> hide =
      new ActionName<String>('NotesActions-hide');
  static final ActionName<PairNotePayload> unpair =
      new ActionName<PairNotePayload>('NotesActions-unpair');
  static final ActionName<PairNotePayload> pair =
      new ActionName<PairNotePayload>('NotesActions-pair');
  static final ActionName<String> remove =
      new ActionName<String>('NotesActions-remove');
  static final ActionName<Note> update =
      new ActionName<Note>('NotesActions-update');
}
