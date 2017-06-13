// GENERATED CODE - DO NOT MODIFY BY HAND

part of app;

// **************************************************************************
// Generator: BuiltReduxGenerator
// Target: abstract class AppActions
// **************************************************************************

class _$AppActions extends AppActions {
  RefMiddlewareActions ref = new RefMiddlewareActions();
  CreationMiddlewareActions creation = new CreationMiddlewareActions();
  UsersActions users = new UsersActions();
  GroupsActions groups = new GroupsActions();
  BoardsActions boards = new BoardsActions();
  AuthActions auth = new AuthActions();
  ActionDispatcher<String> setCurrentBoard =
      new ActionDispatcher<String>('AppActions-setCurrentBoard');

  ActionDispatcher<Null> clear = new ActionDispatcher<Null>('AppActions-clear');
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();
  syncWithStore(dispatcher) {
    ref.syncWithStore(dispatcher);
    creation.syncWithStore(dispatcher);
    users.syncWithStore(dispatcher);
    groups.syncWithStore(dispatcher);
    boards.syncWithStore(dispatcher);
    auth.syncWithStore(dispatcher);
    setCurrentBoard.syncWithStore(dispatcher);
    clear.syncWithStore(dispatcher);
  }
}

class AppActionsNames {
  static ActionName setCurrentBoard =
      new ActionName<String>('AppActions-setCurrentBoard');
  static ActionName clear = new ActionName<Null>('AppActions-clear');
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class App
// **************************************************************************

class _$App extends App {
  @override
  final Auth auth;
  @override
  final Users users;
  @override
  final Groups groups;
  @override
  final Boards boards;
  @override
  final String currentBoardUid;
  BuiltMap<String, dynamic> __currentGroupBoardsMap;
  Iterable<dynamic> __currentGroupBoards;
  dynamic __currentBoard;
  dynamic __mostRecentBoard;
  Iterable<dynamic> __restOfBoards;

  factory _$App([void updates(AppBuilder b)]) =>
      (new AppBuilder()..update(updates)).build();

  _$App._(
      {this.auth, this.users, this.groups, this.boards, this.currentBoardUid})
      : super._() {
    if (auth == null) throw new ArgumentError.notNull('auth');
    if (users == null) throw new ArgumentError.notNull('users');
    if (groups == null) throw new ArgumentError.notNull('groups');
    if (boards == null) throw new ArgumentError.notNull('boards');
    if (currentBoardUid == null)
      throw new ArgumentError.notNull('currentBoardUid');
  }

  @override
  BuiltMap<String, dynamic> get currentGroupBoardsMap =>
      __currentGroupBoardsMap ??= super.currentGroupBoardsMap;

  @override
  Iterable<dynamic> get currentGroupBoards =>
      __currentGroupBoards ??= super.currentGroupBoards;

  @override
  dynamic get currentBoard => __currentBoard ??= super.currentBoard;

  @override
  dynamic get mostRecentBoard => __mostRecentBoard ??= super.mostRecentBoard;

  @override
  Iterable<dynamic> get restOfBoards => __restOfBoards ??= super.restOfBoards;

  @override
  App rebuild(void updates(AppBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppBuilder toBuilder() => new AppBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! App) return false;
    return auth == other.auth &&
        users == other.users &&
        groups == other.groups &&
        boards == other.boards &&
        currentBoardUid == other.currentBoardUid;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, auth.hashCode), users.hashCode), groups.hashCode),
            boards.hashCode),
        currentBoardUid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('App')
          ..add('auth', auth)
          ..add('users', users)
          ..add('groups', groups)
          ..add('boards', boards)
          ..add('currentBoardUid', currentBoardUid))
        .toString();
  }
}

class AppBuilder implements Builder<App, AppBuilder> {
  _$App _$v;

  AuthBuilder _auth;
  AuthBuilder get auth => _$this._auth ??= new AuthBuilder();
  set auth(AuthBuilder auth) => _$this._auth = auth;

  UsersBuilder _users;
  UsersBuilder get users => _$this._users ??= new UsersBuilder();
  set users(UsersBuilder users) => _$this._users = users;

  GroupsBuilder _groups;
  GroupsBuilder get groups => _$this._groups ??= new GroupsBuilder();
  set groups(GroupsBuilder groups) => _$this._groups = groups;

  BoardsBuilder _boards;
  BoardsBuilder get boards => _$this._boards ??= new BoardsBuilder();
  set boards(BoardsBuilder boards) => _$this._boards = boards;

  String _currentBoardUid;
  String get currentBoardUid => _$this._currentBoardUid;
  set currentBoardUid(String currentBoardUid) =>
      _$this._currentBoardUid = currentBoardUid;

  AppBuilder();

  AppBuilder get _$this {
    if (_$v != null) {
      _auth = _$v.auth?.toBuilder();
      _users = _$v.users?.toBuilder();
      _groups = _$v.groups?.toBuilder();
      _boards = _$v.boards?.toBuilder();
      _currentBoardUid = _$v.currentBoardUid;
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
            auth: auth?.build(),
            users: users?.build(),
            groups: groups?.build(),
            boards: boards?.build(),
            currentBoardUid: currentBoardUid);
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
    state.boards.reduce(state.boards, a, builder.boards);
    state.groups.reduce(state.groups, a, builder.groups);
    state.users.reduce(state.users, a, builder.users);
    state.auth.reduce(state.auth, a, builder.auth);
  }
}
