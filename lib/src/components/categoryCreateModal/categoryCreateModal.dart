import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'category-create-modal',
  templateUrl: 'categoryCreateModal.html',
)
class CategoryCreateModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  CategoryCreateModalComponent(StoreService storeService) : _store = storeService.store;

  bool get visible => _store.state.visibleModal == CREATE_CATEGORY_MODAL;

  String title = "";

  String description = "";

  void addCategory() {
    _store.actions.creation.category(
      new CreateCategoryPayload(
        title,
        description,
      ),
    );
    resetCategoryForm();
    _store.actions.hideModal(null);
  }

  void resetCategoryForm() {
    description = "";
    _store.actions.hideModal(null);
  }
}
