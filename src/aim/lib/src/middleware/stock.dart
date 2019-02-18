import 'package:redux/redux.dart';
import '../app.dart';
import '../state/all.dart';
import '../model/stock.dart';
import '../model/quote.dart';
import '../action/stock.dart';

Future<void> getAllStocks(Store<AppState> store, action, NextDispatcher next) async {
  // only load stocks once
  if ((store.state?.market?.stocks?.isLoading??false) || (store.state?.market?.stocks?.isUsable??false))
    return;

  try{
    // dispatch to next
    next(action);
    // get all stocks
    List<ModelStock> stocks = await App.remote.smds.getAllStocks();
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
    ModelStockDetail stock = await App.remote.smds.getStockDetail(action.id);
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
    ModelQuote quote = await App.remote.smds.getStockQuote(action.id);
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
    List<ModelQuote> quotes = await App.remote.smds.getStocksQuote(action.stocks);
    store.dispatch(ActionGetStocksQuoteSucceed(quotes: quotes));
  }catch(e) {
    store.dispatch(ActionGetStocksQuoteFailed(error: e.toString()));
  }
}