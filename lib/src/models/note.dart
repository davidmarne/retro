library note;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'note.g.dart';

/// [Note]
abstract class Note implements Built<Note, NoteBuilder> {
  static Serializer<Note> get serializer => _$noteSerializer;

  /// [id] is the note's identifier
  String get uid;

  /// [text] is the note's text
  String get ownerUid;

  String get categoryUid;

  String get itemUid;

  // Built value boilerplate
  Note._();
  factory Note([updates(NoteBuilder b)]) = _$Note;
}
