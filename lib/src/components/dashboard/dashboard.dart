import 'package:angular/angular.dart';
import 'package:built_redux/built_redux.dart';

import '../boardCreate/boardCreate.dart';
import '../boardCard/boardCard.dart';
import '../../models/board.dart';
import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard.html',
  directives: const [
    BoardCreateComponent,
    BoardCardComponent,
    COMMON_DIRECTIVES,
  ],
)
class DashboardComponent implements OnInit {
  final Store<App, AppBuilder, AppActions> _store;

  DashboardComponent(StoreService storeService) : _store = storeService.store;

  void ngOnInit() {
    _store.actions.boards.setCurrent("");
    _store.actions.sessions.setCurrent("");
  }

  String get userName => _store.state.users.current.name;

  // TODO: Put most recent board first

  Iterable<Board> get boards => _store.state.boards.map.values;
}
