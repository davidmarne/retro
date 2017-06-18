import 'package:angular2/core.dart';
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
  ],
)
class DashboardComponent {
  final Store<App, AppBuilder, AppActions> _store;

  DashboardComponent(StoreService storeService) : _store = storeService.store;

  String get userName => _store.state.auth.currentUser.displayName;

  // TODO: Put most recent board first

  Iterable<Board> get boards => _store.state.boards.map.values;
}
