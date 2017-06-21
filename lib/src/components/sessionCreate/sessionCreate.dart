import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../middleware/creationMiddleware.dart';
import '../../store.dart';

int DEFAULT_TARGET_TIME = 30;

@Component(
  selector: 'session-create',
  templateUrl: 'sessionCreate.html',
)
class SessionCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  SessionCreateComponent(StoreService storeService) : _store = storeService.store;

  int targetTimeMinutes;

  void submit() {
    _store.actions.creation.session(new CreateSessionPayload(targetTimeMinutes*60));
    resetForm();
  }

  void resetForm() {
    targetTimeMinutes = DEFAULT_TARGET_TIME;
  }
}
