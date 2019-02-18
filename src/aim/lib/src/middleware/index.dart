import 'package:redux/redux.dart';
import '../app.dart';
import '../state/all.dart';
import '../model/index.dart';
import '../model/quote.dart';
import '../action/index.dart';

Future<void> getIndexes(Store<AppState> store, ActionGetIndexes action, NextDispatcher next) async {
  // only get market indexes once
  if((store.state.market?.indexes?.isLoading??false) || (store.state.market?.indexes?.isUsable??false))
    return;

  try{
    // dispatch action to next
    next(action);
    // get all indexes
    List<ModelIndex> indexes = await App.remote.smds.getAllIndexes();
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
    ModelIndexDetail index = await App.remote.smds.getIndexDetail(action.id);
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
    ModelQuote quote = await App.remote.smds.getIndexQuote(action.id);
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
    List<ModelQuote> quotes = await App.remote.smds.getIndexesQuote(action.indexes);
    store.dispatch(ActionGetIndexesQuoteSucceed(quotes: quotes));
  }catch(e) {
    store.dispatch(ActionGetIndexesQuoteFailed(error: e.toString()));
  }
}
