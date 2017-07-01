import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../dashboard/dashboard.dart';
import '../boardDashboard/boardDashboard.dart';
import '../categoryCreateModal/categoryCreateModal.dart';
import '../itemCreateModal/itemCreateModal.dart';
import '../sessionDashboard/sessionDashboard.dart';
import '../../store.dart';

import '../../models/board.dart';
import '../../models/session.dart';

import '../../state/app.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES, CategoryCreateModalComponent, ItemCreateModalComponent],
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

  Board get board => _storeService.store.state.boards.current;
  bool showBoardCrumb() => _storeService.store.state.boards.currentUid != "";

  bool get showModal => _storeService.store.state.visibleModal != NO_MODAL;

  logIn() => _storeService.signIn();

  logOut() => _storeService.signOut();

  hideModal() => _storeService.store.actions.hideModal(null);
}
