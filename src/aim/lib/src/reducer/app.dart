import 'package:redux/redux.dart';

import '../state/app.dart';
import '../action/app.dart';


// reducer for app change tab
final appTabReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, ActionChangeAppTab>(_changeTab),
]);

AppTab _changeTab(AppTab state, ActionChangeAppTab action) {
  return action.tab;
}


// reducer for app launch
final appLaunchReducer = combineReducers<AppLaunch>([
  TypedReducer<AppLaunch, ActionAppLaunch>(_appLaunch),
  TypedReducer<AppLaunch, ActionAppLaunchSucceed>(_appLaunchSucceed),
  TypedReducer<AppLaunch, ActionAppLaunchFailed>(_appLaunchFailed),
  TypedReducer<AppLaunch, ActionAppLaunchFinished>(_appLaunchFinished),
]);

AppLaunch _appLaunch(AppLaunch state, ActionAppLaunch action) {
  return state.copyWith(status: DataStatus.loading);
}

AppLaunch _appLaunchSucceed(AppLaunch state, ActionAppLaunchSucceed action) {
  return state.copyWith(config: action.config, status: DataStatus.loaded);
}

AppLaunch _appLaunchFailed(AppLaunch state, ActionAppLaunchFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}

AppLaunch _appLaunchFinished(AppLaunch state, ActionAppLaunchFinished action) {
  return state.copyWith(finished: true);
}


// reducer for app upgrade
final appUpgradeReducer = combineReducers<AppUpgrade>(
  [

  ]
);
