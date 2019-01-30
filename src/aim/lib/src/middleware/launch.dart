import 'package:redux/redux.dart';

import '../app.dart';
import '../config.dart';
import '../state/app.dart';
import '../local/all.dart';
import '../model/user.dart';
import '../action/user.dart';
import '../action/launch.dart';


Future<void> launchApp(Store<AppState> store, action, NextDispatcher next) async {
  try{
    // next action
    next(action);
    // init app
    await App.init();
    // init user
    ModelUser user = Local.sp.getUser();
    store.dispatch(ActionSessionLogin(sid: user?.sid, uid: user?.uid));
    // launch succeed
    store.dispatch(ActionLaunchSucceed(Config.launchDuration, Config.launchImageUrl, Config.launchAssetKey));
  } catch(e) {
    // launch failed
    store.dispatch(ActionLaunchFailed(error: e.toString()));
  }
}
