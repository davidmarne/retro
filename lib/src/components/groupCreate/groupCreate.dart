import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../middleware/creationMiddleware.dart';
import '../../store.dart';

@Component(
  selector: 'group-create',
  templateUrl: 'groupCreate.html',
)
class GroupCreateComponent {
  final Store<App, AppBuilder, AppActions> _store;

  GroupCreateComponent(StoreService storeService) : _store = storeService.store;

  /// [displayName] is the group's display name
  String displayName;

  String description;

  // /// [users] are the users the group contains
  // BuiltList<String> get users;
  void submit() {
    _store.actions.creation.group(new CreateGroupPayload(displayName, description, []));
    resetForm();
  }

  void resetForm() {
    displayName = "";
    description = "";
  }
}
