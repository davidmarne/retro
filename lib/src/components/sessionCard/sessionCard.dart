import 'package:angular/angular.dart';
// import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/board.dart';
import '../../models/session.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'session-card',
  templateUrl: 'sessionCard.html',
  directives: const [routerDirectives, coreDirectives],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class SessionCardComponent {
  final Store<App, AppBuilder, AppActions> _store;

  SessionCardComponent(StoreService storeService) : _store = storeService.store;

  @Input()
  Session session;

  Board get board => _store.state.boards.map[session.boardUid];
  
  String lastActive() => dateTime(session.createdDate);
 
  bool isLatest() => _store.state.boardsLatestSession?.uid == session.uid;

  bool get canDeleteCard => board?.ownerUid == _store.state.users.currentUid;

  void initiateShred() {
    _store.actions.sessions.setCurrent(session.uid);
    _store.actions.showModal(CONFIRM_SHRED_SESSION_MODAL);
  }
}
