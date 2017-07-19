import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/category.dart';
import '../../state/app.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'category-create',
  templateUrl: 'categoryCreate.html',
)
class CategoryCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  CategoryCreateComponent(StoreService storeService) : _store = storeService.store;

  String title = "";

  String description = "";

  String color = CAT_COLORS[0];

  void addCategory() {
    _store.actions.creation.category(
      new CreateCategoryPayload(
        title,
        description,
        color,
      ),
    );
    resetCategoryForm();
  }

  void resetCategoryForm() {
    description = "";
  }
}
