import 'dart:html';
import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:built_redux/built_redux.dart';

import '../../state/app.dart';
import '../../models/category.dart';
import '../../store.dart';
import '../../middleware/creationMiddleware.dart';

@Component(
    selector: 'div[item-create-modal]',
    templateUrl: 'itemCreateModal.html',
    directives: const [
      COMMON_DIRECTIVES,
      formDirectives,
    ])
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
    _store.actions.hideModal(null);
  }

  void hideModal() => _store.actions.hideModal(null);
}
