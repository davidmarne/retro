import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../models/group.dart';

@Component(
  selector: 'group-card',
  templateUrl: 'groupCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class GroupCardComponent {
  @Input()
  Group group;
}
