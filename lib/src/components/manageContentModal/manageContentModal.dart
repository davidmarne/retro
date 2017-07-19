import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/category.dart';
import '../../models/item.dart';
import '../../state/app.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'manage-content-modal',
  templateUrl: 'manageContentModal.html',
)
class ManageContentModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  ManageContentModalComponent(StoreService storeService) : _store = storeService.store;

  bool get visible => _store.state.visibleModal == MANAGE_CONTENT_MODAL;

  Iterable<Category> get categories => _store.state.manageableSessionCategories;

  Iterable<Item> get items => _store.state.manageableSessionItems;
  
  Iterable<Item> itemsForCategory(Category category) => items.where((item) => item.categoryUid == category.uid);

  void toggleCategoryVisibility(Category category) {
    if (category.visible) {
      _store.actions.categories.hide(category.uid);
    } else {
      _store.actions.categories.show(category.uid);
    }
  }

  void toggleItemVisibility(Item item) {
    if (item.visible) {
      _store.actions.items.hide(item.uid);
    } else {
      _store.actions.items.show(item.uid);
    }
  }
}
