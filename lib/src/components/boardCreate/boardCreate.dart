import 'package:angular2/core.dart';
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

  bool repeated = false;

  double interval = 1.0;

  DateIntervalKinds intervalKind = DateIntervalKinds.Day;

  void submit() {
    _store.actions.creation.board(
      new CreateBoardPayload(
        title,
        description,
        repeated ? interval.toInt() : 0,
        intervalKind,
      ),
    );

    resetForm();
  }

  void resetForm() {
    print(interval);
    print(intervalKind.index);
    title = "";
    description = "";
    // var intervalMs = ;
  }

  String dateIntervalKindString(DateIntervalKinds k) => dateIntervalKindToString(k);
}
