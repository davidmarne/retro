import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../models/board.dart';

@Component(
  selector: 'board-card',
  templateUrl: 'boardCard.html',
  directives: const [ROUTER_DIRECTIVES],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class BoardCardComponent {
  @Input()
  Board board;
}
