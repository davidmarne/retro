import 'dart:async';

import 'package:angular/core.dart';
import 'package:built_redux/built_redux.dart';
import 'package:firebase/firebase.dart' as firebase;

import './state/app.dart';
import './refs.dart';
import './streamSubManager.dart';
import './firebaseClient.dart';
import './middleware/creationMiddleware.dart';
import './middleware/refMiddleware.dart';
import './middleware/loggingMiddleware.dart';

@Injectable()
class StoreService {
  Store<App, AppBuilder, AppActions> store;
  FirebaseClient _client;

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

    var actions = new AppActions();
    _client = new FirebaseClient(
        new Refs(_firebaseDatabase), new StreamSubManager(), actions);
    store = new Store<App, AppBuilder, AppActions>(
      createReducer(),
      new App(),
      actions,
      middleware: [
        loggingMiddleware,
        createRefMiddleware(_client),
        createCreationMiddleware(_client),
      ],
    );
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

  Future _authChanged(firebase.AuthEvent e) async {
    if (e.user == null) {
      store.actions.clear(null);
      return;
    }

    final user = await _client.userFromFirebaseUser(e.user);
    store.actions.users.update(user);
    store.actions.users.setCurrent(user.uid);
  }
}
