library notes;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/note.dart';

part 'notes.g.dart';

////////////////////
/// Actions
///////////////////

/// [NotesActions]
abstract class NotesActions extends ReduxActions {
  ActionDispatcher<Note> update;
  ActionDispatcher<String> remove;
  // update text
  // tag item with note
  // show / hide
  ActionDispatcher<String> hide;
  ActionDispatcher<String> show;

  // factory to create on instance of the generated implementation of BoardsActions
  NotesActions._();
  factory NotesActions() => new _$NotesActions();
}

////////////////////
/// State
///////////////////

/// [Notes]
abstract class Notes extends BuiltReducer<Notes, NotesBuilder>
    implements Built<Notes, NotesBuilder> {
  /// [map] contains a map of Note uid to Note.
  BuiltMap<String, Note> get map;

  /// [reducer]
  get reducer => _reducer;

  // Built value boilerplate
  Notes._();
  factory Notes([updates(NotesBuilder b)]) => new _$Notes((NotesBuilder b) => b);

  @memoized
  BuiltList<Note> get visible => new BuiltList<Note>(map.values.where((value) => value.visible));
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Notes, NotesBuilder>()
      ..add<Note>(NotesActionsNames.update, _updateNote)
      ..add<String>(NotesActionsNames.remove, _removeNote))
    .build();

////////////////////
/// Reducers
///////////////////

_updateNote(Notes state, Action<Note> action, NotesBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_removeNote(Notes state, Action<String> action, NotesBuilder builder) =>
    builder..map.remove(action.payload);
