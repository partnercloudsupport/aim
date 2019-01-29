import 'package:redux/redux.dart';

import '../state/launch.dart';
import '../action/launch.dart';


// reducer for loading main index action
final launchReducer = combineReducers<LaunchState>([
  TypedReducer<LaunchState, ActionLaunch>(_launch),
  TypedReducer<LaunchState, ActionLaunchSucceed>(_launchSucceed),
  TypedReducer<LaunchState, ActionLaunchFailed>(_launchFailed),
]);

LaunchState _launch(LaunchState state, ActionLaunch action) {
  return state.copyWith(status: ActionStatus.doing);
}

LaunchState _launchSucceed(LaunchState state, ActionLaunchSucceed action) {
  return state.copyWith(status: ActionStatus.done);
}

LaunchState _launchFailed(LaunchState state, ActionLaunchFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}
