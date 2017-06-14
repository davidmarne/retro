import 'dart:async';

import 'package:angular2/core.dart';
import 'package:built_redux/built_redux.dart';
import 'package:firebase/firebase.dart' as firebase;

import './state/app.dart';
import './middleware/creationMiddleware.dart';
import './middleware/refMiddleware.dart';
import './middleware/subSpyMiddleware.dart';
import './middleware/loggingMiddleware.dart';

@Injectable()
class StoreService {
  Store<App, AppBuilder, AppActions> store;

  final firebase.App _firebaseApp;
  final firebase.GoogleAuthProvider _firebaseGoogleAuthProvider;
  final firebase.Auth _firebaseAuth;
  final firebase.Database _firebaseDatabase;

  // Create a Redux store holding the state of the app.
  StoreService()
      : _firebaseApp = firebase.initializeApp(
          apiKey: "AIzaSyDaBXYly0o2WF9v_MT3uiSkObyyAZ8aBJ0",
          authDomain: "dart-board.firebaseapp.com",
          databaseURL: "https://dart-board.firebaseio.com",
          storageBucket: "dart-board.appspot.com",
        ),
        _firebaseGoogleAuthProvider = new firebase.GoogleAuthProvider(),
        _firebaseAuth = firebase.auth(),
        _firebaseDatabase = firebase.database() {
    _firebaseAuth.onAuthStateChanged.listen(_authChanged);

    store = new Store<App, AppBuilder, AppActions>(new App(), new AppActions(), middleware: [
      loggingMiddleware,
      createRefMiddleware(new StreamSubManager(_firebaseDatabase)),
      createCreationMiddleware(_firebaseDatabase),
      createSubSpyMiddleware(_firebaseDatabase),
    ]);
  }

  Future signIn() async {
    try {
      await _firebaseAuth.signInWithRedirect(_firebaseGoogleAuthProvider);
    } catch (error) {
      try {
        await _firebaseAuth.signInWithPopup(_firebaseGoogleAuthProvider);
      } catch (error) {
        print("Failed to login: $error}");
      }
    }
  }

  Future signOut() async {
    _firebaseAuth.signOut();
  }

  void _authChanged(firebase.AuthEvent e) {
    if (e.user == null) {
      store.actions.clear(null);
    } else {
      store.actions.auth.logIn(e.user);
    }
  }
}
