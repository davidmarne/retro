import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/category.dart';
import '../../store.dart';

@Component(
    selector: 'div[note-create-modal]',
    templateUrl: 'noteCreateModal.html',
    directives: const [
      COMMON_DIRECTIVES,
      formDirectives,
    ])
class NoteCreateModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  NoteCreateModalComponent(StoreService storeService)
      : _store = storeService.store;

  Category get category => _store.state.categories.current;

  String text = "";

  void addNote() {
    _store.actions.creation.note(text);
    hideModal();
  }

  void hideModal() {
    text = "";
    _store.actions.hideModal(null);
  }
}
