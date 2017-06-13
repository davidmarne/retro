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
  // const Route(path: '/item/:id', name: 'Item', component: ItemComponent),
  // const Route(path: '/user', name: 'User', component: UserComponent),
  // const Route(path: '/todos', name: 'Todos', component: TodosComponent),
])
class AppComponent {
  final StoreService _storeService;
  // final RouteParams _routeParams;

  AppComponent(StoreService storeService) : _storeService = storeService;

  bool get loggedIn => _storeService.store.state.auth.loggedIn;

  // String get currentGroupId => _routeParams.get('guid');
  //
  // String get currentBoardId => _routeParams.get('buid');

  logIn() => _storeService.signIn();

  logOut() => _storeService.signOut();
}
