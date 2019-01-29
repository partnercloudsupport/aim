import 'package:redux/redux.dart';

import '../app.dart';
import '../state/app.dart';
import '../action/launch.dart';


void launchApp(Store<AppState> store, action, NextDispatcher next) async {
  try{
    // next action
    next(action);
    // init app
    await App.init();
    // launch succeed
    store.dispatch(ActionLaunchSucceed());
  } catch(e) {
    // launch failed
    store.dispatch(ActionLaunchFailed(error: e.toString()));
  }
}
