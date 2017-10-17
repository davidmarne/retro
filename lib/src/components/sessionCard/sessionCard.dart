import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/session.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'session-card',
  templateUrl: 'sessionCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class SessionCardComponent {
  final Store<App, AppBuilder, AppActions> _store;

  SessionCardComponent(StoreService storeService) : _store = storeService.store;

  @Input()
  Session session;
  
  String lastActive() => dateTime(session.createdDate);
 
  bool isLatest() => _store.state.boardsLatestSession?.uid == session.uid;

  void initiateShred() {
    _store.actions.sessions.setCurrent(session.uid);
    _store.actions.showModal(CONFIRM_SHRED_MODAL);
  }
}
