import 'package:redux/redux.dart';

import '../../model/index.dart';
import '../../remote/service.dart';

import '../state.dart';
import '../actions/index.dart';


void fetchMainIndexes(Store<StateApp> store, action, NextDispatcher dispatcher) async {
  try{
    ModelIndexes indexes = await RemoteService.fetchMainIndexes();
    store.dispatch(ActionLoadMainIndexesSucceed(indexes: indexes));
  } catch(e) {
    store.dispatch(ActionLoadMainIndexesFailed(msg: e.toString()));
  }
}


void updateMainIndexesQuote(Store<StateApp> store, action, NextDispatcher dispatcher) async {
  try {
    var indexCodes = store.state.indexes.mainIndexes.codes;
    ModelIndexQuotes quotes = await RemoteService.fetchIndexQuotes(indexCodes);
    store.dispatch(ActionUpdateMainIndexesQuoteSucceed(quotes: quotes));
  }catch(e) {
    store.dispatch(ActionUpdateMainIndexesQuoteFailed(msg: e.toString()));
  }
}
