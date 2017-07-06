import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:built_redux/built_redux.dart';

import '../itemCard/itemCard.dart';
import '../itemCreate/itemCreate.dart';
import '../categoryCreate/categoryCreate.dart';
import '../noteCreate/noteCreate.dart';
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
    CategoryCreateComponent,
    NoteCreateComponent,
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

  // url params

  String get buid => _routeParams.get('buid');

  String get suid => _routeParams.get('suid');

  // Built state

  Board get board => _store.state.boards.current;

  Session get session => _store.state.sessions.current;

  Iterable<Category> get categories => _store.state.currentSessionCategories;

  Iterable<Item> get items => _store.state.currentSessionItems;

  Iterable<Note> get notes => _store.state.currentSessionNotes;
  
  Iterable<Item> itemsForCategory(Category category) => items.where((item) => item.categoryUid == category.uid);

  // column class for category
  String catColumnClass() {
    switch(categories.length) {
      case 1:
      return "is-8";
      case 2:
      return "is-4";
      case 3:
      return "is-3";
      case 4:
      return "is-3";
    }
    return "";
  }

  String catColorClass(Category cat) {
    switch(categories.toList().indexOf(cat)) {
      case 0:
      return "is-info";
      case 1:
      return "is-success";
      case 2:
      return "is-warning";
      case 3:
      return "is-danger";
    }
    return "is-dark";
  }

  bool supported(Item item) => item.supporterUids.containsKey(_store.state.users.currentUid);

  void toggleSupport(Item item) {
    if (supported(item)) {
      _store.actions.items.removeSupport(item.uid);
    } else {
      _store.actions.items.addSupport(item.uid);
    }
  }

  String printSupporters(Item item) {
    if(item.supporterUids.isEmpty) return "";
    else return "+${item.supporterUids.length}";
  }

  bool showAddCatMargins() => categories.length < 4;

  // showingNotes bound to Show Notes button
  bool showingNotes = false;

  void toggleShowingNotes() {
    showingNotes = !showingNotes;
  }

  void initiateCategoryCreation() {
    _store.actions.showModal(CREATE_CATEGORY_MODAL);
  }

  void initiateItemCreation(Category category) {
    _store.actions.categories.setCurrent(category.uid);
    _store.actions.showModal(CREATE_ITEM_MODAL);
  }

  String heroText() => _store.state.heroItem?.text ?? "";

  String heroAuthor() => _store.state.users.map[_store.state.heroItem?.ownerUid]?.name ?? "";

  bool started() => session != null ? session.started : false;

  bool completed() => session != null ? session.completed : false;

  void startSession() {
    _store.actions.sessions.start(null);
    _store.actions.sessions.present(_store.state.items.map.values.first.uid);
  }

  void endSession() {
    _store.actions.sessions.present("");
    _store.actions.sessions.end(null);
  }

  void prev() {
    int index = items.toList().indexOf(_store.state.heroItem);
    if (index != -1) {
      index = (index - 1) % items.length;
      _store.actions.sessions.present(items.toList()[index].uid);
    }
  }

  void next() {
    int index = items.toList().indexOf(_store.state.heroItem);
    if (index != -1) {
      index = (index + 1) % items.length;
      _store.actions.sessions.present(items.toList()[index].uid);
    }
  }
}
