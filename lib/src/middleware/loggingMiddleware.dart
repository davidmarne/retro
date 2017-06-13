import 'package:built_redux/built_redux.dart';
import '../state/app.dart';

NextActionHandler loggingMiddleware(MiddlewareApi<App, AppBuilder, AppActions> api) =>
    (ActionHandler next) => (Action action) {
          next(action);
          print("Action: ${action.name}");
          print("Payload: ${action.payload}");
          print("Nex State: ${api.state}");
        };
