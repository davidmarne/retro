import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:built_redux/built_redux.dart';

import '../itemCard/itemCard.dart';
import '../itemCreate/itemCreate.dart';
import '../../middleware/creationMiddleware.dart';
import '../../models/board.dart';
import '../../models/item.dart';
import '../../models/category.dart';
import '../../state/app.dart';
import '../../store.dart';

const String DEFAULT_CATEGORY_COLOR = '#000000';

@Component(
  selector: 'boardDashboard',
  templateUrl: 'boardDashboard.html',
  directives: const [
    ROUTER_DIRECTIVES,
    ItemCreateComponent,
    ItemCardComponent,
  ],
)
class BoardDashboardComponent implements OnInit {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;

  BoardDashboardComponent(StoreService storeService, this._routeParams)
      : _store = storeService.store;

  void ngOnInit() {
    if (guid != _store.state.groups.currentGroupUid) _store.actions.groups.setCurrentGroup(guid);
    if (buid != _store.state.currentBoardUid) _store.actions.setCurrentBoard(buid);
  }

  String get guid => _routeParams.get('guid');

  String get buid => _routeParams.get('buid');

  Board get board => _store.state.currentBoard;

  Iterable<Item> itemsForCategory(Category c) => board.items.values.where(
        (Item item) => item.categoryUid == c.uid,
      );

  // showingNotes bound to Show Notes button
  bool showingNotes = false;
  void toggleShowingNotes() {
    showingNotes = !showingNotes;
  }

  // creation value bound to category create input
  String categoryCreationValue = "";
  String creationColor = DEFAULT_CATEGORY_COLOR;
  void sumbitCategoryCreation() {
    _store.actions.creation.category(
      new CreateCategoryPayload(guid, buid, categoryCreationValue, creationColor),
    );
    resetCategoryCreation();
  }

  void resetCategoryCreation() {
    categoryCreationValue = "";
    creationColor = DEFAULT_CATEGORY_COLOR;
  }
}
