import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../dashboard/dashboard.dart';
import '../boardDashboard/boardDashboard.dart';
import '../categoryCreateModal/categoryCreateModal.dart';
import '../confirmShredModal/confirmShredModal.dart';
import '../itemCreateModal/itemCreateModal.dart';
import '../latestSessionDashboard/latestSessionDashboard.dart';
import '../manageContentModal/manageContentModal.dart';
import '../noteCreateModal/noteCreateModal.dart';
import '../sessionDashboard/sessionDashboard.dart';
import '../signInModal/signInModal.dart';
import '../../store.dart';

import '../../models/board.dart';

import '../../state/app.dart';

@Component(selector: 'app', templateUrl: 'app.html', directives: const [
  formDirectives,
  ROUTER_DIRECTIVES,
  CORE_DIRECTIVES,
  CategoryCreateModalComponent,
  ItemCreateModalComponent,
  ManageContentModalComponent,
  NoteCreateModalComponent,
  ConfirmShredModalComponent,
  SignInModalComponent,
], providers: const [
  StoreService
])
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
  final String confirm_shred_board_modal = CONFIRM_SHRED_BOARD_MODAL;
  final String confirm_shred_session_modal = CONFIRM_SHRED_SESSION_MODAL;
  final String create_category_modal = CREATE_CATEGORY_MODAL;
  final String create_item_modal = CREATE_ITEM_MODAL;
  final String create_note_modal = CREATE_NOTE_MODAL;
  final String manage_content_modal = MANAGE_CONTENT_MODAL;
  final String sign_in_modal = SIGN_IN_MODAL;

  AppComponent(StoreService storeService) : _storeService = storeService;

  String email;

  String password;

  bool get loggedIn => _storeService.store.state.users.loggedIn;
  bool get showBoardCrumb => loggedIn && _storeService.store.state.boards.currentUid != "";
  bool get showMobileMenu => _storeService.store.state.showMobileMenu;

  Board get board => _storeService.store.state.boards.current;

  bool showEitherModal(String modalA, String modalB) => showModal(modalA) || showModal(modalB);

  bool showModal(String modal) =>
      modal == _storeService.store.state.visibleModal;

  logIn() => _storeService.signIn();

  logOut() => _storeService.signOut();

  createEmailAccount() => _storeService.createEmailAccount(email, password);

  signInWithEmail() => _storeService.signInWithEmail(email, password);

  initiatePasswordReset() => _storeService.initiatePasswordReset(email);

  toggleMobileMenu() => _storeService.store.actions.toggleMobileMenu(null);

  void showSignInModal() {
    _storeService.store.actions.showModal(SIGN_IN_MODAL);
  }

  void showManageContentModal() {
    _storeService.store.actions.showModal(MANAGE_CONTENT_MODAL);
  }
}
