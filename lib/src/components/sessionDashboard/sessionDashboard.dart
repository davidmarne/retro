import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:built_redux/built_redux.dart';

import '../itemCard/itemCard.dart';
import '../itemCreate/itemCreate.dart';
import '../../middleware/creationMiddleware.dart';
import '../../models/board.dart';
import '../../models/session.dart';

import '../../models/category.dart';
import '../../models/item.dart';
import '../../models/note.dart';

import '../../state/app.dart';
import '../../store.dart';

@Component(
  selector: 'sessionDashboard',
  templateUrl: 'sessionDashboard.html',
  directives: const [
    ROUTER_DIRECTIVES,
    ItemCreateComponent,
    ItemCardComponent,
  ],
)
class SessionDashboardComponent implements OnInit {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;

  SessionDashboardComponent(StoreService storeService, this._routeParams)
      : _store = storeService.store;

  void ngOnInit() {
    if (buid != _store.state.boards.currentUid) _store.actions.boards.setCurrent(buid);
    if (suid != _store.state.sessions.currentUid) _store.actions.sessions.setCurrent(suid);
  }

  String get buid => _routeParams.get('buid');

  String get suid => _routeParams.get('suid');

  Board get board => _store.state.boards.current;

  Session get session => _store.state.sessions.current;

  // TODO: filter down to only categories for the current session.
  Iterable<Category> get categories => _store.state.categories.map.values;

  Iterable<Item> get items => _store.state.items.map.values;

  Iterable<Note> get notes => _store.state.notes.map.values;
  
  Iterable<Item> itemsForCategory(Category category) => items.where((item) => item.categoryUid == category.uid);

  // showingNotes bound to Show Notes button
  bool showingNotes = false;
  
  void toggleShowingNotes() {
    showingNotes = !showingNotes;
  }

  // creation value bound to category create input
  String categoryCreationTitle = "";

  String categoryCreationDescription = "";

  void sumbitCategoryCreation() {
    _store.actions.creation.category(
      new CreateCategoryPayload(categoryCreationTitle, categoryCreationDescription, 0),
    );
    resetCategoryCreation();
  }

  void resetCategoryCreation() {
    categoryCreationTitle = "";
    categoryCreationDescription = "";
  }
}
