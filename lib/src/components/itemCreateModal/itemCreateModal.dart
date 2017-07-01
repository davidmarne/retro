import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/category.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'item-create-modal',
  templateUrl: 'itemCreateModal.html',
)
class ItemCreateModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  ItemCreateModalComponent(StoreService storeService) : _store = storeService.store;

  bool get visible => _store.state.visibleModal == CREATE_ITEM_MODAL;

  String description = "";

  void addItem() {
    _store.actions.creation.item(
      new CreateItemPayload(
        description,
        _store.state.categories.currentUid,
      ),
    );
    resetItemForm();
    _store.actions.hideModal(null);
  }

  void resetItemForm() {
    description = "";
    _store.actions.hideModal(null);
  }
}
