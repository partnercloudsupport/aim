import 'package:redux/redux.dart';

import '../state/market.dart';
import '../action/market.dart';

// market indexes
final marketIndexesReducer = combineReducers<Map<String, ModelIndex>>([
  TypedReducer<Map<String, ModelIndex>, ActionGetMainIndexes>(_getMainIndexes),
  TypedReducer<Map<String, ModelIndex>, ActionGetMainIndexesSucceed>(_getMainIndexesSucceed),
  TypedReducer<Map<String, ModelIndex>, ActionGetMainIndexesFailed>(_getMainIndexesFailed),
]);



// market main indexes
final marketMainIndexesReducer = combineReducers<MarketMainIndexes>([
  TypedReducer<MarketMainIndexes, ActionGetMainIndexes>(_getMainIndexes),
  TypedReducer<MarketMainIndexes, ActionGetMainIndexesSucceed>(_getMainIndexesSucceed),
  TypedReducer<MarketMainIndexes, ActionGetMainIndexesFailed>(_getMainIndexesFailed),
]);


MarketMainIndexes _getMainIndexes(MarketMainIndexes state, ActionGetMainIndexes action) {
  return state.copyWith(status: ActionStatus.doing);
}

MarketMainIndexes _getMainIndexesSucceed(MarketMainIndexes state, ActionGetMainIndexesSucceed action) {
  return state.copyWith(indexes: action.indexes, status: ActionStatus.done);
}

MarketMainIndexes _getMainIndexesFailed(MarketMainIndexes state, ActionGetMainIndexesFailed action) {
  return state.copyWith(status: ActionStatus.failed, tip: action.error);
}


final marketReducer = combineReducers<MarketState>([
  TypedReducer<MarketState, ActionLoadMarketData>(_loadMarketData),
  TypedReducer<MarketState, ActionLoadMarketDataSucceed>(_loadMarketDataSucceed),
  TypedReducer<MarketState, ActionLoadMarketDataFailed>(_loadMarketDataFailed),

  TypedReducer<MarketState, ActionUpdateMarketIndexesQuote>(_updateMarketIndexesQuote),
  TypedReducer<MarketState, ActionUpdateMarketIndexesQuoteSucceed>(_updateMarketIndexesQuoteSucceed),
  TypedReducer<MarketState, ActionUpdateMarketIndexesQuoteFailed>(_updateMarketIndexesQuoteFailed),
]);


MarketState _loadMarketData(MarketState state, ActionLoadMarketData action) {
  return state.copyWith(status: ActionStatus.doing);
}

MarketState _loadMarketDataSucceed(MarketState state, ActionLoadMarketDataSucceed action) {
  return state.copyWith(status: ActionStatus.done, indexes: action.indexes, stocks: action.stocks);
}

MarketState _loadMarketDataFailed(MarketState state, ActionLoadMarketDataFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}

MarketState _updateMarketIndexesQuote(MarketState state, ActionUpdateMarketIndexesQuote action) {
  return state;
}

MarketState _updateMarketIndexesQuoteSucceed(MarketState state, ActionUpdateMarketIndexesQuoteSucceed action) {
  return state.updateWith(indexes: action.indexes);
}

MarketState _updateMarketIndexesQuoteFailed(MarketState state, ActionUpdateMarketIndexesQuoteFailed action) {
  return state;
}


//
final stockDetailReducer = combineReducers<StockDetailState>([
  TypedReducer<StockDetailState, ActionGetStockDetail>(_getStockDetail),
  TypedReducer<StockDetailState, ActionGetStockDetailSucceed>(_getStockDetailSucceed),
  TypedReducer<StockDetailState, ActionGetStockDetailFailed>(_getStockDetailFailed),
]);


StockDetailState _getStockDetail(StockDetailState state, ActionGetStockDetail action) {
  return state.copyWith(status: ActionStatus.doing);
}

StockDetailState _getStockDetailSucceed(StockDetailState state, ActionGetStockDetailSucceed action) {
  return state.copyWith(status: ActionStatus.done, detail: action.detail);
}

StockDetailState _getStockDetailFailed(StockDetailState state, ActionGetStockDetailFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}