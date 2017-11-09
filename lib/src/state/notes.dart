library notes;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

import '../models/note.dart';
import 'app.dart';

part 'notes.g.dart';

////////////////////
/// Actions
///////////////////

/// [NotesActions]
abstract class NotesActions extends ReduxActions {
  ActionDispatcher<Note> update;
  ActionDispatcher<String> remove;
  ActionDispatcher<String> setCurrent;

  ActionDispatcher<PairNotePayload> pair;
  ActionDispatcher<PairNotePayload> unpair;

  ActionDispatcher<String> hide;
  ActionDispatcher<String> show;

  // factory to create on instance of the generated implementation of BoardsActions
  NotesActions._();
  factory NotesActions() => new _$NotesActions();
}

////////////////////
/// Payloads
///////////////////

class PairNotePayload {
  final String itemUid;
  final String noteUid;
  PairNotePayload(this.itemUid, this.noteUid);
}

////////////////////
/// State
///////////////////

/// [Notes]
abstract class Notes implements Built<Notes, NotesBuilder> {
  /// [map] contains a map of Note uid to Note.
  BuiltMap<String, Note> get map;

  String get currentUid;

  // Built value boilerplate
  Notes._();
  factory Notes([updates(NotesBuilder b)]) =>
      new _$Notes((NotesBuilder b) => b..currentUid = "");

  @memoized
  Note get current => map[currentUid];

  @memoized
  BuiltList<Note> get visible =>
      new BuiltList<Note>(map.values.where((value) => value.visible));
}

////////////////////
/// Main Reducer
///////////////////

NestedReducerBuilder<App, AppBuilder, Notes, NotesBuilder>
    createNotesReducer() =>
        new NestedReducerBuilder<App, AppBuilder, Notes, NotesBuilder>(
          (state) => state.notes,
          (builder) => builder.notes,
        )
          ..add<Note>(NotesActionsNames.update, _updateNote)
          ..add<String>(NotesActionsNames.remove, _removeNote)
          ..add<String>(NotesActionsNames.setCurrent, _setCurrentNote);

////////////////////
/// Reducers
///////////////////

_updateNote(Notes state, Action<Note> action, NotesBuilder builder) =>
    builder..map[action.payload.uid] = action.payload;

_removeNote(Notes state, Action<String> action, NotesBuilder builder) =>
    builder..map.remove(action.payload);

_setCurrentNote(Notes state, Action<String> action, NotesBuilder builder) =>
    builder..currentUid = action.payload;
