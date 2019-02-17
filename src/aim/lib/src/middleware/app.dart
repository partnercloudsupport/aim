import 'package:redux/redux.dart';
import '../app.dart';
import '../logger.dart';
import '../state/all.dart';
import '../action/app.dart';
import '../action/user.dart';
import '../model/config.dart';
import '../model/launch.dart';


Future<void> appLaunch(Store<AppState> store, ActionAppLaunch action, NextDispatcher next) async {
  try{
    // next action
    next(action);
    // init app
    await App.init();

    // update app config
    store.dispatch(ActionGetAppConfig());
    // update launch config
    store.dispatch(ActionGetLaunchConfig());

    // wait a while for get new launch config
    await Future.delayed(Duration(milliseconds: 100));

    // user session login
    store.dispatch(ActionSessionLogin(user: App.local.sp.getUser()));
    
    // get app launch config
    LaunchConfig launchConfig = await App.launchConfig();
    // launch succeed
    store.dispatch(ActionAppLaunchSucceed(launchConfig));
  } catch(e) {
    // launch failed
    store.dispatch(ActionAppLaunchFailed(error: e.toString()));
  }
}

Future<void> getAppConfig(Store<AppState> store, ActionGetAppConfig action, NextDispatcher next) async {
  try{
    // get app config
    AppConfig appConfig = await App.remote.app.getAppConfig();
    // update app config
    await App.local.sp.setAppConfig(appConfig);
  } catch(e) {
    // update app config failed
    Log.error(e);
  }
}

Future<void> getLaunchConfig(Store<AppState> store, ActionGetLaunchConfig action, NextDispatcher next) async {
  try{
    // get app config
    LaunchConfig launchConfig = await App.remote.app.getLaunchConfig();
    // update launch config
    await App.local.sp.setLaunchConfig(launchConfig);
  } catch(e) {
    // update launch config failed
    Log.error(e);
  }
}
