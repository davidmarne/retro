import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:built_redux/built_redux.dart';

import '../boardCreate/boardCreate.dart';
import '../boardCard/boardCard.dart';
import '../../models/board.dart';
import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'groupDashboard',
  templateUrl: 'groupDashboard.html',
  directives: const [
    ROUTER_DIRECTIVES,
    BoardCreateComponent,
    BoardCardComponent,
  ],
)
class BoardDashboardComponent implements OnInit {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;

  BoardDashboardComponent(StoreService storeService, this._routeParams)
      : _store = storeService.store;

  void ngOnInit() {
    if (guid != _store.state.groups.currentGroupUid) _store.actions.groups.setCurrentGroup(guid);
  }

  String get guid => _routeParams.get('guid');

  Group get group => _store.state.groups.currentGroup;

  Board get mostRecentBoard => _store.state.mostRecentBoard;

  Iterable<Board> get restOfBoards => _store.state.restOfBoards;
}
