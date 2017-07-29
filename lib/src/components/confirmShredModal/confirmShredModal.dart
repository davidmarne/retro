import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'div[confirm-shred-modal]',
  templateUrl: 'confirmShredModal.html',
)
class ConfirmShredModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  ConfirmShredModalComponent(StoreService storeService) : _store = storeService.store;

  void confirm() {
    _store.actions.sessions.shred(null);
    _store.actions.hideModal(null);
  }

  void cancel() {
    _store.actions.hideModal(null);
  }

  void hideModal() => _store.actions.hideModal(null);
}
