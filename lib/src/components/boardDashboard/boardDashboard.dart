import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:built_redux/built_redux.dart';

import '../sessionCard/sessionCard.dart';
import '../sessionCreate/sessionCreate.dart';

import '../../models/board.dart';
import '../../models/session.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'boardDashboard',
  templateUrl: 'boardDashboard.html',
  directives: const [
    SessionCreateComponent,
    SessionCardComponent,
    COMMON_DIRECTIVES,
  ],
)
class BoardDashboardComponent implements OnInit {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;

  BoardDashboardComponent(StoreService storeService, this._routeParams)
      : _store = storeService.store;

  void ngOnInit() {
    if (buid != _store.state.boards.current)
      _store.actions.boards.setCurrent(buid);
    _store.actions.sessions.setCurrent("");
  }

  String get buid => _routeParams.get('buid');

  Board get board => _store.state.boards.current;

  // TODO: Put most recent session first

  Iterable<Session> get sessions => _store.state.currentBoardSessions;
}
