import 'package:redux/redux.dart';

import '../state/apptab.dart';
import '../action/apptab.dart';

// reducer for loading main index action
final appTabReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, ActionChangeAppTab>(_changeTab),
]);


AppTab _changeTab(AppTab state, ActionChangeAppTab action) {
  return action.tab;
}

