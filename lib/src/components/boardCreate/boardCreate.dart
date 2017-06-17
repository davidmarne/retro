import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../middleware/creationMiddleware.dart';
import '../../store.dart';

@Component(
  selector: 'board-create',
  templateUrl: 'boardCreate.html',
)
class BoardCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  BoardCreateComponent(StoreService storeService) : _store = storeService.store;

  String title;

  String description;

  void submit() {
    _store.actions.creation.board(
      new CreateBoardPayload(
        title,
        description,
      ),
    );

    resetForm();
  }

  void resetForm() {
    title = "";
    description = "";
  }
}
