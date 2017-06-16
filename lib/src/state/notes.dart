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
  ActionDispatcher<Note> insertNote;
  ActionDispatcher<Note> updateNote;
    // update text
    // tag item with note
  ActionDispatcher<Note> removeNote;

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
}

////////////////////
/// Main Reducer
///////////////////

var _reducer = (new ReducerBuilder<Notes, NotesBuilder>()
      ..add<Note>(NotesActionsNames.insertNote, _setNote)
      ..add<Note>(NotesActionsNames.updateNote, _setNote)
      ..add<Note>(NotesActionsNames.removeNote, _unsetNote))
    .build();

////////////////////
/// Reducers
///////////////////

_setNote(Notes state, Action<Note> action, NotesBuilder builder) =>
    builder..noteMap[action.payload.uid] = action.payload;

_unsetNote(Notes state, Action<Note> action, NotesBuilder builder) =>
    builder..noteMap.remove(action.payload.uid);
