// GENERATED CODE - DO NOT MODIFY BY HAND

part of app;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class AppActions
// **************************************************************************

class _$AppActions extends AppActions {
  CreationMiddlewareActions creation = new CreationMiddlewareActions();
  NotesActions notes = new NotesActions();
  ItemsActions items = new ItemsActions();
  CategoriesActions categories = new CategoriesActions();
  SessionsActions sessions = new SessionsActions();
  BoardsActions boards = new BoardsActions();
  UsersActions users = new UsersActions();
  ActionDispatcher<Null> clear = new ActionDispatcher<Null>('AppActions-clear');
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();
  syncWithStore(dispatcher) {
    creation.syncWithStore(dispatcher);
    notes.syncWithStore(dispatcher);
    items.syncWithStore(dispatcher);
    categories.syncWithStore(dispatcher);
    sessions.syncWithStore(dispatcher);
    boards.syncWithStore(dispatcher);
    users.syncWithStore(dispatcher);
    clear.syncWithStore(dispatcher);
  }
}

class AppActionsNames {
  static ActionName clear = new ActionName<Null>('AppActions-clear');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class App
// **************************************************************************

class _$App extends App {
  @override
  final Users users;
  @override
  final Boards boards;
  @override
  final Sessions sessions;
  @override
  final Categories categories;
  @override
  final Items items;
  @override
  final Notes notes;
  BuiltList<Session> __currentBoardSessions;
  Board __usersLatestBoard;
  Session __boardsLatestSession;
  BuiltList<Category> __currentSessionCategories;
  BuiltList<Item> __currentSessionItems;
  BuiltList<Note> __currentSessionNotes;

  factory _$App([void updates(AppBuilder b)]) =>
      (new AppBuilder()..update(updates)).build();

  _$App._(
      {this.users,
      this.boards,
      this.sessions,
      this.categories,
      this.items,
      this.notes})
      : super._() {
    if (users == null) throw new ArgumentError.notNull('users');
    if (boards == null) throw new ArgumentError.notNull('boards');
    if (sessions == null) throw new ArgumentError.notNull('sessions');
    if (categories == null) throw new ArgumentError.notNull('categories');
    if (items == null) throw new ArgumentError.notNull('items');
    if (notes == null) throw new ArgumentError.notNull('notes');
  }

  @override
  BuiltList<Session> get currentBoardSessions =>
      __currentBoardSessions ??= super.currentBoardSessions;

  @override
  Board get usersLatestBoard => __usersLatestBoard ??= super.usersLatestBoard;

  @override
  Session get boardsLatestSession =>
      __boardsLatestSession ??= super.boardsLatestSession;

  @override
  BuiltList<Category> get currentSessionCategories =>
      __currentSessionCategories ??= super.currentSessionCategories;

  @override
  BuiltList<Item> get currentSessionItems =>
      __currentSessionItems ??= super.currentSessionItems;

  @override
  BuiltList<Note> get currentSessionNotes =>
      __currentSessionNotes ??= super.currentSessionNotes;

  @override
  App rebuild(void updates(AppBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppBuilder toBuilder() => new AppBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! App) return false;
    return users == other.users &&
        boards == other.boards &&
        sessions == other.sessions &&
        categories == other.categories &&
        items == other.items &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, users.hashCode), boards.hashCode),
                    sessions.hashCode),
                categories.hashCode),
            items.hashCode),
        notes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('App')
          ..add('users', users)
          ..add('boards', boards)
          ..add('sessions', sessions)
          ..add('categories', categories)
          ..add('items', items)
          ..add('notes', notes))
        .toString();
  }
}

class AppBuilder implements Builder<App, AppBuilder> {
  _$App _$v;

  UsersBuilder _users;
  UsersBuilder get users => _$this._users ??= new UsersBuilder();
  set users(UsersBuilder users) => _$this._users = users;

  BoardsBuilder _boards;
  BoardsBuilder get boards => _$this._boards ??= new BoardsBuilder();
  set boards(BoardsBuilder boards) => _$this._boards = boards;

  SessionsBuilder _sessions;
  SessionsBuilder get sessions => _$this._sessions ??= new SessionsBuilder();
  set sessions(SessionsBuilder sessions) => _$this._sessions = sessions;

  CategoriesBuilder _categories;
  CategoriesBuilder get categories =>
      _$this._categories ??= new CategoriesBuilder();
  set categories(CategoriesBuilder categories) =>
      _$this._categories = categories;

  ItemsBuilder _items;
  ItemsBuilder get items => _$this._items ??= new ItemsBuilder();
  set items(ItemsBuilder items) => _$this._items = items;

  NotesBuilder _notes;
  NotesBuilder get notes => _$this._notes ??= new NotesBuilder();
  set notes(NotesBuilder notes) => _$this._notes = notes;

  AppBuilder();

  AppBuilder get _$this {
    if (_$v != null) {
      _users = _$v.users?.toBuilder();
      _boards = _$v.boards?.toBuilder();
      _sessions = _$v.sessions?.toBuilder();
      _categories = _$v.categories?.toBuilder();
      _items = _$v.items?.toBuilder();
      _notes = _$v.notes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(App other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$App;
  }

  @override
  void update(void updates(AppBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$App build() {
    final result = _$v ??
        new _$App._(
            users: users?.build(),
            boards: boards?.build(),
            sessions: sessions?.build(),
            categories: categories?.build(),
            items: items?.build(),
            notes: notes?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class App
// **************************************************************************

class AppReduceChildren {
  reduceChildren(App state, Action<dynamic> a, AppBuilder builder) {
    state.notes.reduce(state.notes, a, builder.notes);
    state.items.reduce(state.items, a, builder.items);
    state.categories.reduce(state.categories, a, builder.categories);
    state.sessions.reduce(state.sessions, a, builder.sessions);
    state.boards.reduce(state.boards, a, builder.boards);
    state.users.reduce(state.users, a, builder.users);
  }
}
