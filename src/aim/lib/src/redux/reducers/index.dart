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
  return state.copyWith(state: State.loading());
}

StateMainIndexes _loadMainIndexesSucceed(StateMainIndexes state, ActionLoadMainIndexesSucceed action) {
  var indexes = action.indexes.items?.map((item){
    return StateMainIndex(index: item);
  })?.toList();

  return state.copyWith(state: State.loaded(), indexes: indexes);
}

StateMainIndexes _loadMainIndexesFailed(StateMainIndexes state, ActionLoadMainIndexesFailed action) {
  return state.copyWith(state: State.failed(action.msg));
}

StateMainIndexes _updateMainIndexesQuote(StateMainIndexes state, ActionUpdateMainIndexesQuote action) {
  return state;
}

StateMainIndexes _updateMainIndexesQuoteSucceed(StateMainIndexes state, ActionUpdateMainIndexesQuoteSucceed action) {
  return state.updateWith(quotes: action.quotes?.items);
}

StateMainIndexes _updateMainIndexesQuoteFailed(StateMainIndexes state, ActionUpdateMainIndexesQuoteFailed action) {
  return state.copyWith(state: State.failed(action.msg));
}