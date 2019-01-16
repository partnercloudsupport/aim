import 'dart:developer';
import 'package:redux/redux.dart';

import '../states/index.dart';
import '../actions/index.dart';


// reducer for loading main index action
final mainIndexReducer = combineReducers<MainIndexesState>([
  TypedReducer<MainIndexesState, ActionLoadMainIndexes>(_loadMainIndexes),
  TypedReducer<MainIndexesState, ActionLoadMainIndexesSucceed>(_loadMainIndexesSucceed),
  TypedReducer<MainIndexesState, ActionLoadMainIndexesFailed>(_loadMainIndexesFailed),
]);


MainIndexesState _loadMainIndexes(MainIndexesState state, ActionLoadMainIndexes action) {
  log('load');
  return MainIndexesState(status: Status.loading);
}

MainIndexesState _loadMainIndexesSucceed(MainIndexesState state, ActionLoadMainIndexesSucceed action) {
  return MainIndexesState(status: Status.loaded, indexes: action.indexes);
}

MainIndexesState _loadMainIndexesFailed(MainIndexesState state, ActionLoadMainIndexesFailed action) {
  return MainIndexesState(status: Status.failed, msg: action.msg);
}
