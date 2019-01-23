import 'package:redux/redux.dart';

import '../states/index.dart';
import '../actions/index.dart';


// reducer for loading main index action
final mainIndexReducer = combineReducers<StateMainIndexes>([
  TypedReducer<StateMainIndexes, ActionLoadMainIndexes>(_loadMainIndexes),
  TypedReducer<StateMainIndexes, ActionLoadMainIndexesSucceed>(_loadMainIndexesSucceed),
  TypedReducer<StateMainIndexes, ActionLoadMainIndexesFailed>(_loadMainIndexesFailed),

  TypedReducer<StateMainIndexes, ActionUpdateMainIndexesQuote>(_updateMainIndexesQuote),
  TypedReducer<StateMainIndexes, ActionUpdateMainIndexesQuoteSucceed>(_updateMainIndexesQuoteSucceed),
  TypedReducer<StateMainIndexes, ActionUpdateMainIndexesQuoteFailed>(_updateMainIndexesQuoteFailed),
]);


StateMainIndexes _loadMainIndexes(StateMainIndexes state, ActionLoadMainIndexes action) {
  return state.copyWith(state: LState.loading());
}

StateMainIndexes _loadMainIndexesSucceed(StateMainIndexes state, ActionLoadMainIndexesSucceed action) {
  return state.copyWith(state: LState.loaded(), indexes: action.indexes?.items, quotes: action.quotes?.items);
}

StateMainIndexes _loadMainIndexesFailed(StateMainIndexes state, ActionLoadMainIndexesFailed action) {
  return state.copyWith(state: LState.failed(action.msg));
}

StateMainIndexes _updateMainIndexesQuote(StateMainIndexes state, ActionUpdateMainIndexesQuote action) {
  return state;
}

StateMainIndexes _updateMainIndexesQuoteSucceed(StateMainIndexes state, ActionUpdateMainIndexesQuoteSucceed action) {
  return state.updateWith(quotes: action.quotes?.items);
}

StateMainIndexes _updateMainIndexesQuoteFailed(StateMainIndexes state, ActionUpdateMainIndexesQuoteFailed action) {
  return state;
}