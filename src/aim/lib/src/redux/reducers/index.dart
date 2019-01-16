import 'package:redux/redux.dart';

import '../states/index.dart';
import '../actions/index.dart';


// reducer for loading main index action
final mainIndexReducer = combineReducers<MainIndexesState>([
  TypedReducer<MainIndexesState, ActionLoadMainIndexes>(_loadMainIndexes),
  TypedReducer<MainIndexesState, ActionLoadMainIndexesSucceed>(_loadMainIndexesSucceed),
  TypedReducer<MainIndexesState, ActionLoadMainIndexesFailed>(_loadMainIndexesFailed),

  TypedReducer<MainIndexesState, ActionUpdateMainIndexesQuote>(_updateMainIndexesQuote),
  TypedReducer<MainIndexesState, ActionUpdateMainIndexesQuoteSucceed>(_updateMainIndexesQuoteSucceed),
  TypedReducer<MainIndexesState, ActionUpdateMainIndexesQuoteFailed>(_updateMainIndexesQuoteFailed),
]);


MainIndexesState _loadMainIndexes(MainIndexesState state, ActionLoadMainIndexes action) {
  return MainIndexesState(status: Status.loading);
}

MainIndexesState _loadMainIndexesSucceed(MainIndexesState state, ActionLoadMainIndexesSucceed action) {
  return MainIndexesState(status: Status.loaded, indexes: action.indexes);
}

MainIndexesState _loadMainIndexesFailed(MainIndexesState state, ActionLoadMainIndexesFailed action) {
  return MainIndexesState(status: Status.failed, msg: action.msg);
}

MainIndexesState _updateMainIndexesQuote(MainIndexesState state, ActionUpdateMainIndexesQuote action) {
  return state;
}

MainIndexesState _updateMainIndexesQuoteSucceed(MainIndexesState state, ActionUpdateMainIndexesQuoteSucceed action) {
  state.update(action.indexes);
  return state;
}

MainIndexesState _updateMainIndexesQuoteFailed(MainIndexesState state, ActionUpdateMainIndexesQuoteFailed action) {
  return state;
}