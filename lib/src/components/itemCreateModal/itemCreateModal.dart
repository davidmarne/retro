import 'dart:html';
import 'dart:async';
import 'package:angular/core.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/category.dart';
import '../../store.dart';
import '../../constants.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
  selector: 'div[item-create-modal]',
  templateUrl: 'itemCreateModal.html',
)
class ItemCreateModalComponent {
  final Store<App, AppBuilder, AppActions> _store;

  ItemCreateModalComponent(StoreService storeService)
      : _store = storeService.store;

  Category get category => _store.state.categories.current;

  String description = "";

  void addItem() {
    _store.actions.creation.item(
      new CreateItemPayload(
        description,
        _store.state.categories.currentUid,
      ),
    );
    resetItemForm();
    _store.actions.hideModal(null);
  }

  void resetItemForm() {
    description = "";
    hideModal();
  }

  hideModal() async {
    Element modalCard = document.querySelector('.modal-card');
    Element modalBackground = document.querySelector('.modal-background');
    modalCard.className = "modal-card animated zoomOut fast";
    modalBackground.className = "modal-background animated fadeOut fast";

    new Future.delayed(
        new Duration(milliseconds: 300), () => _store.actions.hideModal(null));
  }
}
