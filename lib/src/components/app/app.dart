import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../dashboard/dashboard.dart';
import '../groupDashboard/groupDashboard.dart';
import '../boardDashboard/boardDashboard.dart';
import '../../store.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS, StoreService])
@RouteConfig(const [
  const Route(
    path: '/dashboard',
    name: 'Dashboard',
    component: DashboardComponent,
    useAsDefault: true,
  ),
  const Route(
    path: '/group/:guid',
    name: 'Group',
    component: GroupDashboardComponent,
  ),
  const Route(
    path: '/group/:guid/board/:buid',
    name: 'Board',
    component: BoardDashboardComponent,
  ),
])
class AppComponent {
  final StoreService _storeService;

  AppComponent(StoreService storeService) : _storeService = storeService;

  bool get loggedIn => _storeService.store.state.auth.loggedIn;

  logIn() => _storeService.signIn();

  logOut() => _storeService.signOut();
}
