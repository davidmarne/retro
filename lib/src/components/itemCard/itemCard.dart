import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';

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

  bool supported() => item.supporterUids.containsKey(_store.state.users.currentUid);

  void toggleSupport() {
    if (supported()) {
      _store.actions.items.removeSupport(item.uid);
    } else {
      _store.actions.items.addSupport(item.uid);
    }
  }
}
