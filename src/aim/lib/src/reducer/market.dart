import 'package:redux/redux.dart';
import '../model/index.dart';
import '../state/market.dart';
import '../action/market.dart';

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

// market stocks
final marketStocksReducer = combineReducers<MarketStocks>([
  TypedReducer<MarketStocks, ActionGetStocks>(_getStocks),
  TypedReducer<MarketStocks, ActionGetStocksSucceed>(_getStocksSucceed),
  TypedReducer<MarketStocks, ActionGetStocksFailed>(_getStocksFailed),

  TypedReducer<MarketStocks, ActionGetStockQuote>(_getStockQuote),
  TypedReducer<MarketStocks, ActionGetStockQuoteSucceed>(_getStockQuoteSucceed),
  TypedReducer<MarketStocks, ActionGetStockQuoteFailed>(_getStockQuoteFailed),

  TypedReducer<MarketStocks, ActionGetStocksQuote>(_getStocksQuote),
  TypedReducer<MarketStocks, ActionGetStocksQuoteSucceed>(_getStocksQuoteSucceed),
  TypedReducer<MarketStocks, ActionGetStocksQuoteFailed>(_getStocksQuoteFailed),

]);

MarketStocks _getStocks(MarketStocks state, ActionGetStocks action) {
  return state.copyWith(status: DataStatus.loading);
}
MarketStocks _getStocksSucceed(MarketStocks state, ActionGetStocksSucceed action) {
  return state.copyWith(stocks: Map.fromIterable(action.stocks, key: (stock)=>stock.id), status: DataStatus.loaded);
}
MarketStocks _getStocksFailed(MarketStocks state, ActionGetStocksFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}

MarketStocks _getStockQuote(MarketStocks state, ActionGetStockQuote action) {
  return state;
}
MarketStocks _getStockQuoteSucceed(MarketStocks state, ActionGetStockQuoteSucceed action) {
  return state.updateWith(action.quote);
}
MarketStocks _getStockQuoteFailed(MarketStocks state, ActionGetStockQuoteFailed action) {
  return state;
}

MarketStocks _getStocksQuote(MarketStocks state, ActionGetStocksQuote action) {
  return state;
}
MarketStocks _getStocksQuoteSucceed(MarketStocks state, ActionGetStocksQuoteSucceed action) {
  return state.updateWith(action.quotes);
}
MarketStocks _getStocksQuoteFailed(MarketStocks state, ActionGetStocksQuoteFailed action) {
  return state;
}

// get stock detail
final marketStockDetailReducer = combineReducers<MarketStockDetail>([
  TypedReducer<MarketStockDetail, ActionGetStockDetail>(_getStockDetail),
  TypedReducer<MarketStockDetail, ActionGetStockDetailSucceed>(_getStockDetailSucceed),
  TypedReducer<MarketStockDetail, ActionGetStockDetailFailed>(_getStockDetailFailed),
]);


MarketStockDetail _getStockDetail(MarketStockDetail state, ActionGetStockDetail action) {
  return state.copyWith(status: DataStatus.loading);
}

MarketStockDetail _getStockDetailSucceed(MarketStockDetail state, ActionGetStockDetailSucceed action) {
  return state.copyWith(stock: action.stock, status: DataStatus.loaded);
}

MarketStockDetail _getStockDetailFailed(MarketStockDetail state, ActionGetStockDetailFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}