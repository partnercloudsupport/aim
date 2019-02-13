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
  TypedReducer<AppLaunch, ActionLaunch>(_launch),
  TypedReducer<AppLaunch, ActionLaunchSucceed>(_launchSucceed),
  TypedReducer<AppLaunch, ActionLaunchFailed>(_launchFailed),
  TypedReducer<AppLaunch, ActionLaunchFinished>(_launchFinished),
]);

AppLaunch _launch(AppLaunch state, ActionLaunch action) {
  return state.copyWith(status: ActionStatus.doing);
}

AppLaunch _launchSucceed(AppLaunch state, ActionLaunchSucceed action) {
  return state.copyWith(status: ActionStatus.done, duration: action.duration, imageUrl: action.imageUrl, assetKey: action.assetKey);
}

AppLaunch _launchFailed(AppLaunch state, ActionLaunchFailed action) {
  return state.copyWith(status: ActionStatus.failed, tip: action.error);
}

AppLaunch _launchFinished(AppLaunch state, ActionLaunchFinished action) {
  return state.copyWith(finished: true);
}


// reducer for app upgrade
final appUpgradeReducer = combineReducers<AppUpgrade>(
  [

  ]
);
