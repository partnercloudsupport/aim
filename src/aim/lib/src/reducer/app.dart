import 'market.dart';
import 'launch.dart';

import '../state/all.dart';
import '../state/app.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    launch: launchReducer(state.launch, action),
    market: marketReducer(state.market, action),
  );
}
