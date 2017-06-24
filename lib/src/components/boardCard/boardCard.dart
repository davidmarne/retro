import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/board.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'board-card',
  templateUrl: 'boardCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class BoardCardComponent {
  final Store<App, AppBuilder, AppActions> _store;

  BoardCardComponent(StoreService storeService) : _store = storeService.store;

  @Input()
  Board board;

  String lastActive() => _store.state.date(_store.state.users.current.boardUids[board.uid]);
  
  bool isLatest() => _store.state.usersLatestBoard?.uid == board.uid;

  bool hasLatestSession() => board.latestSessionUid != null;
}
