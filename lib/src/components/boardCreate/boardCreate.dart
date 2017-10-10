import 'package:angular/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/dateIntervalKinds.dart';
import '../../middleware/creationMiddleware.dart';
import '../../store.dart';

@Component(
  selector: 'board-create',
  templateUrl: 'boardCreate.html',
)
class BoardCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  BoardCreateComponent(StoreService storeService) : _store = storeService.store;

  final Iterable<DateIntervalKinds> intervalKinds = DateIntervalKinds.values;

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

  String dateIntervalKindString(DateIntervalKinds k) => dateIntervalKindToString(k);
}
