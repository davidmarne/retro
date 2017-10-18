import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/category.dart';
import '../../state/app.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
    selector: 'div[category-create-modal]',
    templateUrl: 'categoryCreateModal.html',
    directives: const [
      COMMON_DIRECTIVES,
      formDirectives,
    ])
class CategoryCreateModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  CategoryCreateModalComponent(StoreService storeService)
      : _store = storeService.store;

  String title = "";

  String description = "";

  String selectedColor = CAT_COLOR_DEFAULT;

  List<String> colors = CAT_COLORS;

  String colorLabel(String color) => catColorDescription(color);

  void changeColor(String newColor) => selectedColor = newColor;

  void addCategory() {
    _store.actions.creation.category(
      new CreateCategoryPayload(
        title,
        description,
        selectedColor,
      ),
    );
    hideModal();
  }

  void hideModal() {
    title = "";
    description = "";
    selectedColor = CAT_COLOR_DEFAULT;
    _store.actions.hideModal(null);
  }
}
