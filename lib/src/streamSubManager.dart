import 'dart:async';
import 'package:built_redux/built_redux.dart';
import 'package:built_value/serializer.dart';
import 'package:firebase/firebase.dart' as firebase;
import './serializers.dart';

/// [StreamSubManager] keeps track of subsciptions to db refs
class StreamSubManager {
  final Map<String, StreamSubscription<firebase.QueryEvent>> _refs;

  StreamSubManager() : _refs = new Map<String, StreamSubscription<firebase.QueryEvent>>();

  void cancel(firebase.DatabaseReference ref) {
    var path = ref.toString();
    print('removing listener to $path');
    _refs[path].cancel();
    _refs.remove(path);
  }

  void add<T>(
    firebase.DatabaseReference ref,
    ActionDispatcher<T> actionDispatcher,
    Serializer<T> serializer,
  ) {
    var path = ref.toString();

    // if we are already subbed bail
    if (_refs[path] != null) return;
    print('listening to $path');

    // sub to the ref
    _refs[path] = ref.onValue.listen((firebase.QueryEvent event) {
      if (event.snapshot.val() == null) {
        return;
      }

      actionDispatcher(
        serializers.deserializeWith(serializer, event.snapshot.val()),
      );
    });
  }
}
