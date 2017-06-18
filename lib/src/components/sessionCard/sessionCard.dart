import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../models/session.dart';

@Component(
  selector: 'session-card',
  templateUrl: 'sessionCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class SessionCardComponent {
  @Input()
  Session session;
}
