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
    ActionDispatcher<T> onValue,
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

      onValue(
        serializers.deserializeWith(serializer, event.snapshot.val()),
      );
    });
  }

  void cancelList(firebase.DatabaseReference ref) {
    var path = ref.toString();
    print('removing listener to list at $path');
    _refs['$path-onChildAdded']?.cancel();
    _refs['$path-onChildRemoved']?.cancel();
    _refs['$path-onChildChanged']?.cancel();
    _refs['$path-onChildMoved']?.cancel();
    _refs.remove('$path-onChildAdded');
    _refs.remove('$path-onChildRemoved');
    _refs.remove('$path-onChildChanged');
    _refs.remove('$path-onChildMoved');
  }

  void addList<T>(
    firebase.DatabaseReference ref,
    Serializer<T> serializer, {
    ActionDispatcher<T> onChildAdded,
    ActionDispatcher<String> onChildRemoved,
    ActionDispatcher<T> onChildChanged,
    ActionDispatcher<T> onChildMoved,
  }) {
    var path = ref.toString();
    if (_refs['$path-onChildAdded'] != null) return;
    print('listening to list at $path');

    if (onChildAdded != null)
      _refs['$path-onChildAdded'] = ref.onChildAdded.listen((firebase.QueryEvent event) {
        if (event.snapshot.val() == null) return;
        onChildAdded(
          serializers.deserializeWith(serializer, event.snapshot.val()),
        );
      });

    if (onChildRemoved != null)
      _refs['$path-onChildRemoved'] = ref.onChildRemoved.listen((firebase.QueryEvent event) {
        onChildRemoved(event.snapshot.key);
      });

    if (onChildChanged != null)
      _refs['$path-onChildChanged'] = ref.onChildChanged.listen((firebase.QueryEvent event) {
        if (event.snapshot.val() == null) return;
        onChildChanged(
          serializers.deserializeWith(serializer, event.snapshot.val()),
        );
      });

    if (onChildMoved != null)
      _refs['$path-onChildMoved'] = ref.onChildMoved.listen((firebase.QueryEvent event) {
        if (event.snapshot.val() == null) return;
        onChildMoved(
          serializers.deserializeWith(serializer, event.snapshot.val()),
        );
      });
  }
}
