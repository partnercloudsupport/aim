import 'package:redux/redux.dart';
import '../app.dart';
import '../config.dart';
import '../state/all.dart';
import '../local/all.dart';
import '../action/app.dart';
import '../action/user.dart';


Future<void> launchApp(Store<AppState> store, action, NextDispatcher next) async {
  try{
    // next action
    next(action);
    // init app
    await App.init();
    // init user
    store.dispatch(ActionSessionLogin(user: Local.sp.getUser()));
    // launch succeed
    store.dispatch(ActionLaunchSucceed(Config.launchDuration, Config.launchImageUrl, Config.launchAssetKey));
  } catch(e) {
    // launch failed
    store.dispatch(ActionLaunchFailed(error: e.toString()));
  }
}
