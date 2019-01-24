import 'package:redux/redux.dart';

import '../state/app.dart';
import '../model/index.dart';
import '../action/index.dart';
import '../remote/service.dart';



void fetchMainIndexes(Store<StateApp> store, action, NextDispatcher dispatcher) async {
  try{
    ModelIndexes indexes = await RemoteService.fetchMainIndexes();
    ModelIndexes quotes = await RemoteService.fetchIndexQuotes(indexes.codes());
    store.dispatch(ActionLoadMainIndexesSucceed(indexes: indexes?.updateWith(quotes?.items)?.items));
  } catch(e) {
    store.dispatch(ActionLoadMainIndexesFailed(msg: e.toString()));
  }
}


void updateMainIndexesQuote(Store<StateApp> store, action, NextDispatcher dispatcher) async {
  try {
    var indexCodes = store.state.indexes.mainIndexes.codes;
    ModelIndexes quotes = await RemoteService.fetchIndexQuotes(indexCodes);
    store.dispatch(ActionUpdateMainIndexesQuoteSucceed(indexes: quotes.items));
  }catch(e) {
    store.dispatch(ActionUpdateMainIndexesQuoteFailed(msg: e.toString()));
  }
}
