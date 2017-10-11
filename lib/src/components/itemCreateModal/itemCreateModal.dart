import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/category.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'div[item-create-modal]',
  templateUrl: 'itemCreateModal.html',
)
class ItemCreateModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  ItemCreateModalComponent(StoreService storeService) : _store = storeService.store;

  Category get category => _store.state.categories.current;

  String description = "";

  bool isPoll = false;

  List<String> options = [];

  void addItem() {
    _store.actions.creation.item(
      new CreateItemPayload(
        description,
        options,
        _store.state.categories.currentUid,
      ),
    );
    resetItemForm();
    _store.actions.hideModal(null);
  }

  void resetItemForm() {
    description = "";
    options = [];
    _store.actions.hideModal(null);
  }

  void addOption(String text) {
    options.add(text);
  }

  void updateOption(String oldText, newText) {
    for (int i = 0; i < options.length; i++) {
      if (options[i] == oldText) options[i] = newText;
    }
  }

  void removeOption(String text) {
    options.removeWhere((option) => option == text);
  }

  void hideModal() => _store.actions.hideModal(null);
}
