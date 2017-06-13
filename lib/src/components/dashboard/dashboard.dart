import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../groupCreate/groupCreate.dart';
import '../groupCard/groupCard.dart';
import '../../state/app.dart';
import '../../models/group.dart';
import '../../store.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard.html',
  directives: const [
    GroupCreateComponent,
    GroupCardComponent,
  ],
)
class DashboardComponent {
  final Store<App, AppBuilder, AppActions> _store;

  DashboardComponent(StoreService storeService) : _store = storeService.store;

  String get userName => _store.state.auth.currentUser.displayName;

  Group get mostRecentGroup => _store.state.groups.mostRecentGroup;

  Iterable<Group> get restOfGroups => _store.state.groups.restOfGroups;
}
