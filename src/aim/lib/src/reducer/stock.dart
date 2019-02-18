import 'package:redux/redux.dart';
import '../state/market.dart';
import '../action/stock.dart';

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