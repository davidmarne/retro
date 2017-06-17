import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:built_redux/built_redux.dart';

import '../itemCard/itemCard.dart';
import '../itemCreate/itemCreate.dart';
import '../../middleware/creationMiddleware.dart';

import '../../models/board.dart';
import '../../models/session.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'boardDashboard',
  templateUrl: 'boardDashboard.html',
  directives: const [
    ItemCreateComponent,
    ItemCardComponent,
  ],
)
class BoardDashboardComponent implements OnInit {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;

  BoardDashboardComponent(StoreService storeService, this._routeParams)
      : _store = storeService.store;

  void ngOnInit() {
    if (buid != _store.state.boards.current) _store.actions.boards.setCurrent(buid);
  }

  String get buid => _routeParams.get('buid');

  Board get board => _store.state.boards.current;

  // TODO: Put most recent session first

  Iterable<Session> get sessions => _store.state.sessions.map.values;
}
