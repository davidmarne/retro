library note;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'note.g.dart';

/// [Note]
abstract class Note implements Built<Note, NoteBuilder> {
  static Serializer<Note> get serializer => _$noteSerializer;

  String get uid;

  String get boardUid;

  String get sessionUid;

  /// [ownerUid] is the user uid of the item's owner
  String get ownerUid;

  String get text;

  /// [visible] when false, prevent Note from appearing in any sets.
  bool get visible;

  // Built value boilerplate
  Note._();
  factory Note([updates(NoteBuilder b)]) = _$Note;
}
