import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../dashboard/dashboard.dart';
import '../boardDashboard/boardDashboard.dart';
import '../sessionDashboard/sessionDashboard.dart';
import '../../store.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [StoreService])
@RouteConfig(const [
  const Route(
    path: '/home',
    name: 'Home',
    component: DashboardComponent,
    useAsDefault: true,
  ),
  const Route(
    path: '/board/:buid',
    name: 'Board',
    component: BoardDashboardComponent,
  ),
  const Route(
    path: '/board/:buid/session/:suid',
    name: 'Session',
    component: SessionDashboardComponent,
  ),
])
class AppComponent {
  final StoreService _storeService;

  AppComponent(StoreService storeService) : _storeService = storeService;

  bool get loggedIn => _storeService.store.state.users.loggedIn;

  logIn() => _storeService.signIn();

  logOut() => _storeService.signOut();
}
