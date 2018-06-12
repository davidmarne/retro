import 'package:angular/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'div[sign-in-modal]',
  templateUrl: 'signInModal.html',
)
class SignInModalComponent {
  final StoreService _storeService;

  SignInModalComponent(this._storeService);

  logIn() {
    _storeService.signIn();
    hideModal();
  }

  void confirm() {
    hideModal();
  }

  void cancel() {
    hideModal();
  }

  void hideModal() => _storeService.store.actions.hideModal(null);
}
