import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../dashboard/dashboard.dart';
import '../boardDashboard/boardDashboard.dart';
import '../categoryCreateModal/categoryCreateModal.dart';
import '../confirmShredModal/confirmShredModal.dart';
import '../itemCreateModal/itemCreateModal.dart';
import '../latestSessionDashboard/latestSessionDashboard.dart';
import '../manageContentModal/manageContentModal.dart';
import '../sessionDashboard/sessionDashboard.dart';
import '../../store.dart';

import '../../models/board.dart';

import '../../state/app.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ ROUTER_DIRECTIVES, CategoryCreateModalComponent, ItemCreateModalComponent, ManageContentModalComponent, ConfirmShredModalComponent],
    providers: const [StoreService]
)
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
  const Route(
    path: '/board/:buid/latest',
    name: 'LatestSession',
    component: LatestSessionDashboardComponent,
  ),
])
class AppComponent {
  final StoreService _storeService;

  // template is scopes to this component, so const in app isn't visible.
  final String confirm_shred_modal = CONFIRM_SHRED_MODAL;
  final String create_category_modal = CREATE_CATEGORY_MODAL;
  final String create_item_modal = CREATE_ITEM_MODAL;
  final String manage_content_modal = MANAGE_CONTENT_MODAL;

  AppComponent(StoreService storeService) : _storeService = storeService;

  bool get loggedIn => _storeService.store.state.users.loggedIn;

  Board get board => _storeService.store.state.boards.current;
  bool showBoardCrumb() => _storeService.store.state.boards.currentUid != "";

  bool get showMobileMenu => _storeService.store.state.showMobileMenu;

  bool showModal(String modal) => modal == _storeService.store.state.visibleModal;

  logIn() => _storeService.signIn();

  logOut() => _storeService.signOut();

  toggleMobileMenu() => _storeService.store.actions.toggleMobileMenu(null);

  void showManageContentModal() {
    _storeService.store.actions.showModal(MANAGE_CONTENT_MODAL);
  }
}
