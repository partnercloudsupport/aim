import 'package:redux/redux.dart';
import '../model/index.dart';
import '../state/market.dart';
import '../action/market.dart';

// market indexes
final marketIndexesReducer = combineReducers<MarketIndexes>([
  TypedReducer<MarketIndexes, ActionGetIndexes>(_getIndexes),
  TypedReducer<MarketIndexes, ActionGetIndexesSucceed>(_getIndexesSucceed),
  TypedReducer<MarketIndexes, ActionGetIndexesFailed>(_getIndexesFailed),
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