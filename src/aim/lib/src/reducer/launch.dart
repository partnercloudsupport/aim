import 'package:redux/redux.dart';

import '../state/launch.dart';
import '../action/launch.dart';


// reducer for loading main index action
final launchReducer = combineReducers<StateLaunch>([
  TypedReducer<StateLaunch, ActionLaunch>(_launch),
  TypedReducer<StateLaunch, ActionLaunchSucceed>(_launchSucceed),
  TypedReducer<StateLaunch, ActionLaunchFailed>(_launchFailed),
]);

StateLaunch _launch(StateLaunch state, ActionLaunch action) {
  return state.copyWith(state: LState.loading());
}

StateLaunch _launchSucceed(StateLaunch state, ActionLaunchSucceed action) {
  return state.copyWith(state: LState.loaded());
}

StateLaunch _launchFailed(StateLaunch state, ActionLaunchFailed action) {
  return state.copyWith(state: LState.failed(action.msg));
}
