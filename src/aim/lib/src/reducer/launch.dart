import 'package:redux/redux.dart';

import '../state/launch.dart';
import '../action/launch.dart';


// reducer for loading main index action
final launchReducer = combineReducers<LaunchState>([
  TypedReducer<LaunchState, ActionLaunch>(_launch),
  TypedReducer<LaunchState, ActionLaunchSucceed>(_launchSucceed),
  TypedReducer<LaunchState, ActionLaunchFailed>(_launchFailed),
  TypedReducer<LaunchState, ActionLaunchFinished>(_launchFinished),
]);

LaunchState _launch(LaunchState state, ActionLaunch action) {
  return state.copyWith(status: ActionStatus.doing);
}

LaunchState _launchSucceed(LaunchState state, ActionLaunchSucceed action) {
  return state.copyWith(status: ActionStatus.done, duration: action.duration, imageUrl: action.imageUrl, assetKey: action.assetKey);
}

LaunchState _launchFailed(LaunchState state, ActionLaunchFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}

LaunchState _launchFinished(LaunchState state, ActionLaunchFinished action) {
  return state.copyWith(finished: true);
}
