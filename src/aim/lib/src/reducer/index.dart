import 'package:redux/redux.dart';
import '../state/market.dart';
import '../action/index.dart';

// market indexes
final marketIndexesReducer = combineReducers<MarketIndexes>([
  TypedReducer<MarketIndexes, ActionGetIndexes>(_getIndexes),
  TypedReducer<MarketIndexes, ActionGetIndexesSucceed>(_getIndexesSucceed),
  TypedReducer<MarketIndexes, ActionGetIndexesFailed>(_getIndexesFailed),

  TypedReducer<MarketIndexes, ActionGetIndexQuote>(_getIndexQuote),
  TypedReducer<MarketIndexes, ActionGetIndexQuoteSucceed>(_getIndexQuoteSucceed),
  TypedReducer<MarketIndexes, ActionGetIndexQuoteFailed>(_getIndexQuoteFailed),

  TypedReducer<MarketIndexes, ActionGetIndexesQuote>(_getIndexesQuote),
  TypedReducer<MarketIndexes, ActionGetIndexesQuoteSucceed>(_getIndexesQuoteSucceed),
  TypedReducer<MarketIndexes, ActionGetIndexesQuoteFailed>(_getIndexesQuoteFailed),

]);

MarketIndexes _getIndexes(MarketIndexes state, ActionGetIndexes action) {
  return state.copyWith(status: DataStatus.loading);
}
MarketIndexes _getIndexesSucceed(MarketIndexes state, ActionGetIndexesSucceed action) {
  return state.copyWith(indexes: Map.fromIterable(action.indexes, key: (index)=>index.id), status: DataStatus.loaded);
}
MarketIndexes _getIndexesFailed(MarketIndexes state, ActionGetIndexesFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}

MarketIndexes _getIndexQuote(MarketIndexes state, ActionGetIndexQuote action) {
  return state;
}
MarketIndexes _getIndexQuoteSucceed(MarketIndexes state, ActionGetIndexQuoteSucceed action) {
  return state.updateWith(action.quote);
}
MarketIndexes _getIndexQuoteFailed(MarketIndexes state, ActionGetIndexQuoteFailed action) {
  return state;
}

MarketIndexes _getIndexesQuote(MarketIndexes state, ActionGetIndexesQuote action) {
  return state;
}
MarketIndexes _getIndexesQuoteSucceed(MarketIndexes state, ActionGetIndexesQuoteSucceed action) {
  return state.updateWith(action.quotes);
}
MarketIndexes _getIndexesQuoteFailed(MarketIndexes state, ActionGetIndexesQuoteFailed action) {
  return state;
}

// get index detail
final marketIndexDetailReducer = combineReducers<MarketIndexDetail>([
  TypedReducer<MarketIndexDetail, ActionGetIndexDetail>(_getIndexDetail),
  TypedReducer<MarketIndexDetail, ActionGetIndexDetailSucceed>(_getIndexDetailSucceed),
  TypedReducer<MarketIndexDetail, ActionGetIndexDetailFailed>(_getIndexDetailFailed),
]);


MarketIndexDetail _getIndexDetail(MarketIndexDetail state, ActionGetIndexDetail action) {
  return state.copyWith(status: DataStatus.loading);
}

MarketIndexDetail _getIndexDetailSucceed(MarketIndexDetail state, ActionGetIndexDetailSucceed action) {
  return state.copyWith(index: action.index, status: DataStatus.loaded);
}

MarketIndexDetail _getIndexDetailFailed(MarketIndexDetail state, ActionGetIndexDetailFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}
