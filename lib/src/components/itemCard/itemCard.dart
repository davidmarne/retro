import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../state/app.dart';
import 'package:built_redux/built_redux.dart';
import '../../store.dart';
import '../../models/item.dart';

@Component(
  selector: 'item-card',
  templateUrl: 'itemCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ItemCardComponent {
  final Store<App, AppBuilder, AppActions> _store;

    ItemCardComponent(StoreService storeService) : _store = storeService.store;

  @Input()
  Item item;

  void upVote() {
      print(_store.state.users.currentUid);
      _store.actions.items.addSuppportingUser(_store.state.users.currentUid);
  }
}
