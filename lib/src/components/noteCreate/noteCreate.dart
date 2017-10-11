import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
    selector: 'note-create',
    templateUrl: 'noteCreate.html',
    directives: const [
      COMMON_DIRECTIVES,
      formDirectives,
    ])
class NoteCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  NoteCreateComponent(StoreService storeService) : _store = storeService.store;

  String title = "";

  void addNote() {
    _store.actions.creation.note(
      new CreateNotePayload(
        title,
      ),
    );
    resetNoteForm();
  }

  void resetNoteForm() {
    title = "";
  }
}
