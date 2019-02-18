import 'package:redux/redux.dart';

import '../app.dart';
import '../state/all.dart';
import '../model/stock.dart';
import '../action/stock.dart';
import '../action/search.dart';


Future<void> getSearchHistory(Store<AppState> store, ActionGetSearchHistory action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);

    // get all stocks
    if(store.state?.market?.stocks?.stocks == null){
      store.dispatch(ActionGetStocks());
    }

    // get search history
    List<String> stocks = await App.local.sp.getSearchHistory();

    // dispatch succeed action
    store.dispatch(ActionGetSearchHistorySucceed(stocks: stocks));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionGetSearchHistoryFailed(error: e.toString()));
  }
}

Future<void> getSearchHottest(Store<AppState> store, ActionGetSearchHottest action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);

    // get all stocks
    if(store.state?.market?.stocks?.stocks == null){
      store.dispatch(ActionGetStocks());
    }
    // get search hottest stocks
    List<ModelStock> stocks = await App.remote.smds.getHottestStocks();

    // dispatch succeed action
    store.dispatch(ActionGetSearchHottestSucceed(stocks: stocks));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionGetSearchHottestFailed(error: e.toString()));
  }
}

Future<void> getSearchResults(Store<AppState> store, ActionGetSearchResults action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);

    // get all stocks
    if(store.state?.market?.stocks?.stocks == null){
      store.dispatch(ActionGetStocks());
    }
    // search stock
    List<ModelStock> stocks = store.state?.market?.stocks?.searchByWords(action.words)??[];

    // dispatch succeed action
    store.dispatch(ActionGetSearchResultsSucceed(words: action.words, stocks: stocks));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionGetSearchResultsFailed(words: action.words, error: e.toString()));
  }
}

