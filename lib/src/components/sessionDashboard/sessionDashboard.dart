import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:built_redux/built_redux.dart';

import '../itemCard/itemCard.dart';
import '../noteTag/noteTag.dart';

import '../../models/board.dart';
import '../../models/session.dart';
import '../../models/category.dart';
import '../../models/item.dart';
import '../../models/note.dart';

import '../../state/app.dart';
import '../../state/items.dart';
import '../../store.dart';

@Component(
  selector: 'sessionDashboard',
  templateUrl: 'sessionDashboard.html',
  directives: const [
    ROUTER_DIRECTIVES,
    ItemCardComponent,
    NoteTagComponent,
    COMMON_DIRECTIVES,
  ],
)
class SessionDashboardComponent implements OnInit, OnDestroy {
  final Store<App, AppBuilder, AppActions> _store;
  final RouteParams _routeParams;
  final Router _router;

  double heroTimeProgress = 100.0;

  int itemsCovered = 1;

  int itemsRemaining = 1;

  bool ticking = false;

  SessionDashboardComponent(
      StoreService storeService, this._routeParams, this._router)
      : _store = storeService.store;

  void ngOnInit() {
    if (buid != _store.state.boards.currentUid)
      _store.actions.boards.setCurrent(buid);
    if (suid != _store.state.sessions.currentUid)
      _store.actions.sessions.setCurrent(suid);
    ticking = true;
    tick();
  }

  void ngOnDestroy() {
    ticking = false;
  }

  void tick([_]) {
    if (ticking) window.requestAnimationFrame(tick);
    if (!inProgress()) return;
    Item hero = _store.state.hero;
    if (hero == null) return;

    var epoch = now();
    itemsCovered = 0;
    itemsRemaining = 0;
    var remainingPoints = 0;
    int otherItemTime = 0;
    items.forEach((item) {
      if (item != hero) {
        if (isItemCovered(item)) {
          itemsCovered++;
        } else {
          itemsRemaining++;
          remainingPoints += item.supporterUids.length + 1;
        }
        otherItemTime += item.time;
      }
    });
    var heroActualTime = hero.time + (epoch - session.presentedDate);
    var heroPoints = hero.supporterUids.length + 1;
    var remainingTime =
        max(0, session.targetTime - otherItemTime - heroActualTime);
    var heroTargetTime =
        heroPoints * (remainingTime / (remainingPoints + heroPoints));
    heroTimeProgress =
        (heroActualTime / max(heroTargetTime, heroActualTime) * 100.0);
  }

  goToLatest() => _router.navigate([
        'LatestSession',
        {
          'buid': _store.state.boards.currentUid,
        }
      ]);

  // url params

  String get buid => _routeParams.get('buid');

  String get suid => _routeParams.get('suid');

  // Built state

  Board get board => _store.state.boards.current;

  Session get session => _store.state.sessions.current;

  Iterable<Category> get categories => _store.state.visibleSessionCategories;

  Iterable<Item> get items => _store.state.visibleSessionItems;

  Iterable<Note> get notes => _store.state.visibleSessionNotes;

  Iterable<Item> itemsForCategory(Category category) =>
      items.where((item) => item.categoryUid == category.uid);

  List<Item> get orderedItems => new List<Item>.from(
      categories.expand((category) => itemsForCategory(category)));

  Iterable<String> optionsForItem(Item item) => item.pollOptions;

  bool didUserRespond(Item item) =>
      item.pollResponses.containsKey(_store.state.users.currentUid);

  String userResponse(Item item) =>
      item.pollResponses[_store.state.users.currentUid];

  bool optionIsUsersResponse(Item item, String option) =>
      userResponse(item) == option;

  // column class for category
  String catColumnClass() {
    switch (categories.length) {
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

  bool supported(Item item) =>
      item.supporterUids.containsKey(_store.state.users.currentUid);

  void toggleSupport(Item item) {
    if (supported(item)) {
      _store.actions.items.removeSupport(item.uid);
    } else {
      _store.actions.items.addSupport(item.uid);
    }
  }

  void toggleResponse(Item item, String option) {
    if (optionIsUsersResponse(item, option)) {
      removePollResponse(item);
    } else {
      addPollResponse(item, option);
    }
  }

  void addPollResponse(Item item, String option) =>
      _store.actions.items.addPollResponse(new PollResponse(item.uid, option));

  void removePollResponse(Item item) =>
      _store.actions.items.removePollResponse(item.uid);

  bool isItemCovered(Item item) => item.time > 3000;

  bool isItemOwner(Item item) => item.ownerUid == _store.state.users.currentUid;

  void hideItem(Item item) {
    _store.actions.items.hide(item.uid);
  }

  String printSupporters(Item item) {
    if (item.supporterUids.isEmpty)
      return "";
    else
      return "+${item.supporterUids.length}";
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

  void initiateNoteCreation() {
    _store.actions.showModal(CREATE_NOTE_MODAL);
  }

  Item get hero => _store.state.hero;

  String heroText() => hero?.text ?? "";

  String heroCss() {
    if (hero != null) {
      Category heroCat =
          categories.firstWhere((category) => category.uid == hero.categoryUid);
      return textCss(heroCat.color);
    }
    return '';
  }

  String heroAuthor() => _store.state.users.map[hero?.ownerUid]?.name ?? "";

  Iterable<String> heroPollOptions() => _store.state.heroPollResults.keys;

  int heroOptionResult(String option) => _store.state.heroPollResults[option];

  Category heroCategory() => hero != null
      ? categories.firstWhere((category) => category.uid == hero.categoryUid)
      : null;

  Item nextHero() {
    print("nextHero ${orderedItems.map((item) => item.text)}");
    if (orderedItems.length == 0) return null;
    int index = orderedItems.indexOf(hero);
    if (index == -1) return orderedItems.first;
    return orderedItems[(index + 1) % orderedItems.length];
  }

  Item prevHero() {
    print("prevHero ${orderedItems.map((item) => item.text)}");
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
    present(nextHero());
  }

  void present(Item item) {
    _store.actions.sessions.present(item?.uid ?? "");
  }

  void endSession() {
    present(null);
    _store.actions.sessions.end(null);
  }

  void resetSession() {
    _store.actions.sessions.reset(null);
  }

  void cloneSession() {
    _store.actions.creation.cloneSession(null);
    goToLatest();
  }

  void next() => present(nextHero());

  void prev() => present(prevHero());
}
