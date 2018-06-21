import 'package:built_redux/built_redux.dart';
import 'package:wui_builder/components.dart';
import 'package:wui_builder/vhtml.dart';
import 'package:wui_builder/wui_builder.dart';

import 'package:retro/src/store.dart';
import 'package:retro/src/state/app.dart';

import 'package:retro/src/wui_components/navBar.dart';

// Same as the key const in appContextComponent.dart
const _storeKey = 'storeKey';

class AppComponent extends NComponent {
  StoreService _service;

  AppComponent() : _service = new StoreService();

  AppActions get actions => _service.store.actions;

  Store<App, AppBuilder, AppActions> get store => _service.store;

  @override
  Map<String, dynamic> getChildContext() =>
      <String, dynamic>{_storeKey: _service.store};

  @override
  VNode render() => new Vsection()
    ..className = "section"
    ..children = [
      // Navigation
      new NavBar(new NavBarProps()
        ..signIn = _service.signIn
        ..signOut = _service.signOut),
    ];
}