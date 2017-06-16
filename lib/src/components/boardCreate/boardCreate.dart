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

  /// [displayName] is the board's display name
  String displayName;

  String description;

  String startDate;

  String endDate;

  void submit() {
    _store.actions.creation.board(
      new CreateBoardPayload(
        displayName,
        description,
        _store.state.groups.currentGroupUid,
        DateTime.parse(startDate).millisecondsSinceEpoch,
        DateTime.parse(endDate).millisecondsSinceEpoch,
      ),
    );

    resetForm();
  }

  void resetForm() {
    displayName = "";
    description = "";
    startDate = "";
    endDate = "";
  }
}
