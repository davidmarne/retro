import 'dart:html';
import 'dart:math';

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

  double heroTimeProgress = 100.0;

  int itemsCovered = 1;
  
  int itemsRemaining = 1;

  SessionDashboardComponent(StoreService storeService, this._routeParams)
      : _store = storeService.store;

  void ngOnInit() {
    if (buid != _store.state.boards.currentUid) _store.actions.boards.setCurrent(buid);
    if (suid != _store.state.sessions.currentUid) _store.actions.sessions.setCurrent(suid);
    tick();
  }

  void tick([_]) {
    window.requestAnimationFrame(tick);
    if (!inProgress()) return;
    Item heroItem = _store.state.heroItem;
    if (heroItem == null) return;

    var epoch = now();
    itemsCovered = 0;
    itemsRemaining = 0;
    var remainingPoints = 0;
    int otherItemTime = 0;
    items.forEach((item) {
      if (item != heroItem) {
        if (isItemCovered(item)) {
          itemsCovered++;
        } else {
          itemsRemaining++;
          remainingPoints += item.supporterUids.length + 1;
        }
        otherItemTime += item.time;
      }
    });
    var heroActualTime = heroItem.time + (epoch - session.presentedDate);
    var heroPoints = heroItem.supporterUids.length + 1;
    var remainingTime = max(0, session.targetTime - otherItemTime - heroActualTime);
    var heroTargetTime = heroPoints * (remainingTime / (remainingPoints + heroPoints));
    heroTimeProgress = (heroActualTime / max(heroTargetTime, heroActualTime) * 100.0);
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

  List<Item> get orderedItems => new List<Item>.from(categories.expand((category) => itemsForCategory(category)));

  // column class for category
  String catColumnClass() {
    print("categories ${categories.length}");
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

  bool supported(Item item) => item.supporterUids.containsKey(_store.state.users.currentUid);

  void toggleSupport(Item item) {
    if (supported(item)) {
      _store.actions.items.removeSupport(item.uid);
    } else {
      _store.actions.items.addSupport(item.uid);
    }
  }

  bool isItemCovered(Item item) => item.time > 3000;

  bool isItemOwner(Item item) => item.ownerUid == _store.state.users.currentUid;

  void hideItem(Item item) {
    _store.actions.items.hide(item.uid);
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

  Item get hero => _store.state.heroItem;

  String heroText() => hero?.text ?? "";

  String heroAuthor() => _store.state.users.map[hero?.ownerUid]?.name ?? "";

  Item nextHeroItem() {
    print("nextHeroItem ${orderedItems.map((item) => item.text)}");
    if (orderedItems.length == 0) return null;
    int index = orderedItems.indexOf(hero);
    if (index == -1) return orderedItems.first;
    return orderedItems[(index + 1) % orderedItems.length];
  }

  Item prevHeroItem() {
    print("prevHeroItem ${orderedItems.map((item) => item.text)}");
    if (orderedItems.length == 0) return null;
    int index = orderedItems.indexOf(hero);
    if (index == -1) return orderedItems.last;
    return orderedItems[(index - 1) % orderedItems.length];
  }

  bool started() => session != null ? session.started : false;

  bool completed() => session != null ? session.completed : false;

  bool inProgress() => started() && !completed();

  void startSession() {
    _store.actions.sessions.start(null);
    present(nextHeroItem());
  }

  void present(Item item) {
    _store.actions.sessions.present(item?.uid ?? "");
  }

  void endSession() {
    present(null);
    _store.actions.sessions.end(null);
  }

  void next() => present(nextHeroItem());

  void prev() => present(prevHeroItem());
}
