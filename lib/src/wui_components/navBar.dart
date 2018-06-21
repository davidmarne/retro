import 'package:wui_builder/vhtml.dart';
import 'package:wui_builder/wui_builder.dart';

import 'package:retro/src/state/app.dart';
import 'package:retro/src/wui_components/appContextComponent.dart';

class NavBarProps {
  Function signIn;
  Function signOut;
}

class NavBar extends AppContextComponent<NavBarProps, dynamic> {
  NavBar(NavBarProps props) : super(props, [
    (app) => app, // maps to all app changes, pretty heavy handed.
  ]);

  VNode _navMenu() {
    final menuClasses = ["navbar-menu"];
    if (_showMobileMenu()) menuClasses.add("is-active");

    final menuChildren = new List<VNode>();
    menuChildren.add(_signInOutButton());

    return new VDivElement()
      ..classes = menuClasses
      ..children = [
        new VDivElement()
          ..classes = ["navbar-end"]
          ..children = menuChildren,
      ];
  }

  VNode _signInOutButton() {
    String icon = "fa-sign-in";
    String label = "Sign in";
    Function onClick = _signIn;
    final buttonClasses = ["button", "is-info"];
    if (_authStatus() == AuthStatus.loading) {
      buttonClasses.add("is-loading");
    } else {
      buttonClasses.add("is-inverted");
    }
    if (_signedIn()) {
      icon = "fa-sign-out";
      label = "Sign out";
      onClick = _signOut;
    }
    return new Vspan()
      ..classes = ["navbar-item"]
      ..children = [
        new Va()
          ..classes = buttonClasses
          ..children = [
            new Vspan()
              ..classes = ["icon"]
              ..children = [
                new Vi()
                  ..classes = ["fa", icon]
              ],
            new Vspan()
              ..innerHtml = label
          ]
          ..onClick = onClick,
      ];
  }

  @override
  VNode render() => new Vnav()
    ..classes = ["navbar", "is-transparent", "is-fixed-top"]
    ..children = [
      new VDivElement()
        ..classes = ["container"]
        ..children = [
          new VDivElement()
            ..classes = ["navbar-brand"]
            ..children = [
              new Vspan()
                ..classes = ["navbar-item"]
                ..innerHtml = _signedInOutHtml(),
              new Vspan()
                ..classes = ["navbar-burger", "burger"]
                ..children = [
                  new Vspan(),
                  new Vspan(),
                  new Vspan(),
                ]
                ..onClick = _toggleMobileMenu,
            ],
          _navMenu(),
        ],
    ];

  bool _showMobileMenu() => appState.showMobileMenu;

  bool _signedIn() => appState.users.current != null;

  String _authStatus() => appState.authStatus;

  String _signedInOutHtml() {
    return _signedIn() ? "Signed in as:&nbsp;<b>${appState.users.current.name}</b>" : "";
  }

  void _signIn([_]) {
    props.signIn();
    appActions.hideMobileMenu();
  }

  void _signOut([_]) {
    props.signOut();
    appActions.hideMobileMenu();
  }

  void _toggleMobileMenu([_]) {
    if (_showMobileMenu()) {
      appActions.hideMobileMenu();
    } else {
      appActions.showMobileMenu();
    }
  }
}