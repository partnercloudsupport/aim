import 'package:redux/redux.dart';

import '../action/nav.dart';

final navReducer = combineReducers<int>([
  TypedReducer<int, ActionSwtichTab>(_switchTab)
]);


int _switchTab(int state, ActionSwtichTab action) {
  return action.index;
}
