import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../middleware/creationMiddleware.dart';
import '../../store.dart';

int DEFAULT_TARGET_TIME = 30;

@Component(
    selector: 'session-create',
    templateUrl: 'sessionCreate.html',
    directives: const [
      COMMON_DIRECTIVES,
      formDirectives,
    ])
class SessionCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  SessionCreateComponent(StoreService storeService)
      : _store = storeService.store;

  num targetTimeMinutes;

  void submit() {
    _store.actions.creation
        .session(new CreateSessionPayload(targetTimeMinutes.toInt() * 60000));
    resetForm();
  }

  void resetForm() {
    targetTimeMinutes = DEFAULT_TARGET_TIME;
  }
}
