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
  // update text
  // tag item with note
  // show / hide
  ActionDispatcher<String> remove;

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
      ..add<Note>(NotesActionsNames.update, _updateNote))
    .build();

////////////////////
/// Reducers
///////////////////

_updateNote(Notes state, Action<Note> action, NotesBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;
