import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/category.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'item-create',
  templateUrl: 'itemCreate.html',
  directives: const [
    materialDirectives,
  ],
)
class ItemCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  ItemCreateComponent(StoreService storeService) : _store = storeService.store;

  @Input()
  Category category;

  String description = "";

  void addItem() {
    var currentBoard = _store.state.currentBoard;
    _store.actions.creation.item(
      new CreateItemPayload(
        currentBoard.groupUid,
        currentBoard.uid,
        description,
        category.uid,
      ),
    );
    resetItemForm();
  }

  void resetItemForm() {
    description = "";
  }
}
