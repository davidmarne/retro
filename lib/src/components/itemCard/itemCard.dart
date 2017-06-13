import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../models/item.dart';

@Component(
  selector: 'item-card',
  templateUrl: 'itemCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ItemCardComponent {
  @Input()
  Item item;
}
