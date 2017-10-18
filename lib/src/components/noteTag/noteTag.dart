import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../state/notes.dart';
import '../../models/item.dart';
import '../../models/note.dart';
import '../../store.dart';

@Component(
    selector: 'div[note-tag]',
    templateUrl: 'noteTag.html',
    directives: const [
      COMMON_DIRECTIVES,
      formDirectives,
    ])
class NoteTagComponent {
  final Store<App, AppBuilder, AppActions> _store;

  @Input()
  Item item;

  @Input()
  Note note;

  NoteTagComponent(StoreService storeService)
      : _store = storeService.store;

  String get text => note.text;

  int get count => note.itemCount();

  void togglePair() {
    if (item != null) {
      if (paired()) {
        _store.actions.notes.unpair(new PairNotePayload(item.uid, note.uid));
      } else {
        _store.actions.notes.pair(new PairNotePayload(item.uid, note.uid));
      }
    }
  }

  bool paired() => note.itemUids.containsKey(item?.uid);

  void removeNote(MouseEvent event) {
    _store.actions.notes.hide(note.uid);
    print(event);
    event.stopPropagation();
  }
}
