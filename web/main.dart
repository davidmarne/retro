import 'dart:html';

import 'package:angular/core.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:wui_builder/wui_builder.dart';

import 'package:retro/retro.dart';

void main() {
  final app = new AppComponent();
  render(app, querySelector('#app'));

  // bootstrap(AppComponent, [
  //   ROUTER_PROVIDERS,
  //   provide(APP_BASE_HREF, useValue: '/'),
  //   provide(LocationStrategy, useClass: HashLocationStrategy),
  // ]);
}
