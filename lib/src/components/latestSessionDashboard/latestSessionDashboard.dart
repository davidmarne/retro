import 'dart:html';

import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:built_redux/built_redux.dart';

import '../itemCard/itemCard.dart';
import '../noteCreate/noteCreate.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'latestSessionDashboard',
  templateUrl: 'latestSessionDashboard.html',
  directives: const [
    ROUTER_DIRECTIVES,
    NoteCreateComponent,
    ItemCardComponent,
  ],
)
class LatestSessionDashboardComponent implements OnInit, OnDestroy {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;
  final Router _router;

  bool ticking = false;

  LatestSessionDashboardComponent(StoreService storeService, this._routeParams, this._router) :
    _store = storeService.store;

  void ngOnInit() {
    if (buid != _store.state.boards.currentUid) _store.actions.boards.setCurrent(buid);
    ticking = true;
    tick();
  }

  void ngOnDestroy() {
    ticking = false;
  }

  void tick([_]) {
    if (ticking) window.requestAnimationFrame(tick);

    if (_store.state.boards.current != null) {
      var latestSessionUid = _store.state.boards.current.latestSessionUid;
      if (latestSessionUid != null && latestSessionUid != _store.state.sessions.currentUid) {
        goToSession(latestSessionUid);
      }
    }
  }

  goToSession(String sessionUid) => _router.navigate(['Session', {
    'buid': _store.state.boards.currentUid,
    'suid': sessionUid,
  }]);

  // url params

  String get buid => _routeParams.get('buid');
}
