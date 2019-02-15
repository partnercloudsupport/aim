import 'package:redux/redux.dart';
import '../local/all.dart';
import '../remote/all.dart';
import '../state/all.dart';
import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';
import '../action/market.dart';


Future<void> getIndexes(Store<AppState> store, ActionGetIndexes action, NextDispatcher next) async {
  try{
    // dispatch action to next
    next(action);
    // get all indexes
    List<ModelIndex> indexes = await Remote.smds.getAllIndexes();
    // load all indexes succeed
    store.dispatch(ActionGetIndexesSucceed(indexes: indexes));
  } catch(e) {
    // load all indexes failed
    store.dispatch(ActionGetIndexesFailed(error: e.toString()));
  }
}

Future<void> getIndexDetail(Store<AppState> store, ActionGetIndexDetail action, NextDispatcher next) async {
  try {
    // dispatch action to next
    next(action);
    // get index detail
    ModelIndexDetail index = await Remote.smds.getIndexDetail(action.id);
    store.dispatch(ActionGetIndexDetailSucceed(index: index));
  }catch(e) {
    store.dispatch(ActionGetIndexDetailFailed(error: e.toString()));
  }
}

Future<void> getIndexQuote(Store<AppState> store, ActionGetIndexQuote action, NextDispatcher next) async {
  try {
    // dispatch action to next
    next(action);
    // get index quote
    ModelQuote quote = await Remote.smds.getIndexQuote(action.id);
    store.dispatch(ActionGetIndexQuoteSucceed(quote: quote));
  }catch(e) {
    store.dispatch(ActionGetIndexQuoteFailed(error: e.toString()));
  }
}

Future<void> getIndexesQuote(Store<AppState> store, ActionGetIndexesQuote action, NextDispatcher next) async {
  try {
    // dispatch to next
    next(action);
    // get indexes quote
    List<ModelQuote> quotes = await Remote.smds.getIndexesQuote(action.indexes);
    store.dispatch(ActionGetIndexesQuoteSucceed(quotes: quotes));
  }catch(e) {
    store.dispatch(ActionGetIndexesQuoteFailed(error: e.toString()));
  }
}


Future<void> getStocks(Store<AppState> store, action, NextDispatcher next) async {
  try{
    // dispatch to next
    next(action);
    // get all stocks
    List<ModelStock> stocks = await Remote.smds.getAllStocks();
    // load all stocks succeed
    store.dispatch(ActionGetStocksSucceed(stocks: stocks));
  } catch(e) {
    // load all stocks failed
    store.dispatch(ActionGetStocksFailed(error: e.toString()));
  }
}


Future<void> getStockDetail(Store<AppState> store, ActionGetStockDetail action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);
    // get stock detail
    ModelStockDetail stock = await Remote.smds.getStockDetail(action.id);
    // dispatch succeed action
    store.dispatch(ActionGetStockDetailSucceed(stock: stock));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionGetStockDetailFailed(error: e.toString()));
  }
}

Future<void> getStockQuote(Store<AppState> store, ActionGetStockQuote action, NextDispatcher next) async {
  try {
    // dispatch action to next
    next(action);
    // get index quote
    ModelQuote quote = await Remote.smds.getStockQuote(action.id);
    store.dispatch(ActionGetStockQuoteSucceed(quote: quote));
  }catch(e) {
    store.dispatch(ActionGetStockQuoteFailed(error: e.toString()));
  }
}

Future<void> getStocksQuote(Store<AppState> store, ActionGetStocksQuote action, NextDispatcher next) async {
  try {
    // dispatch to next
    next(action);
    // get indexes quote
    List<ModelQuote> quotes = await Remote.smds.getStocksQuote(action.stocks);
    store.dispatch(ActionGetStocksQuoteSucceed(quotes: quotes));
  }catch(e) {
    store.dispatch(ActionGetStocksQuoteFailed(error: e.toString()));
  }
}