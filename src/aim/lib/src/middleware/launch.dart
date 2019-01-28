import 'package:redux/redux.dart';

import '../launch.dart';
import '../state/app.dart';
import '../action/launch.dart';


void launchApp(Store<StateApp> store, action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);

    // init app
    await Launch.init();
    store.dispatch(ActionLaunchSucceed());
  } catch(e) {
    store.dispatch(ActionLaunchFailed(msg: e.toString()));
  }
}
