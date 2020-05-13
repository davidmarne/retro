import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:built_redux/built_redux.dart';

import '../../models/board.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'board-card',
  templateUrl: 'boardCard.html',
  directives: const [
    routerDirectives,
    coreDirectives,
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class BoardCardComponent {
  final Store<App, AppBuilder, AppActions> _store;

  BoardCardComponent(StoreService storeService) : _store = storeService.store;

  @Input()
  Board board;

  String lastActive() => date(_store.state.users.current.boardUids[board.uid]);

  bool isLatest() => _store.state.usersLatestBoard?.uid == board.uid;

  bool hasLatestSession() => board.latestSessionUid != null;

  bool get canDeleteCard => board?.ownerUid == _store.state.users.currentUid;
  
  void initiateShred() {
    _store.actions.boards.setCurrent(board.uid);
    _store.actions.showModal(CONFIRM_SHRED_BOARD_MODAL);
  }
}
