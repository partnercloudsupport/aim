import 'package:redux/redux.dart';

import '../state.dart';

import '../actions/index.dart';
import '../../model/index.dart';

import '../../remote/service.dart';

export '../actions/index.dart';

void fetchMainIndexes(Store<AppState> store, action, NextDispatcher dispatcher) async {
  try{
    ModelIndexes indexes = await RemoteService.fetchMainIndexes();
    store.dispatch(ActionLoadMainIndexesSucceed(indexes: indexes));
  } catch(e) {
    store.dispatch(ActionLoadMainIndexesFailed(msg: e.toString()));
  }
}

void updateMainIndexesQuote(Store<AppState> store, action, NextDispatcher dispatcher) async {
  try {
    var indexCodes = store.state.indexes.mainIndexesState.indexCodes();
    ModelIndexes quotes = await RemoteService.fetchIndexQuotes(indexCodes);
    store.dispatch(ActionUpdateMainIndexesQuoteSucceed(indexes: quotes));
  }catch(e) {
    store.dispatch(ActionUpdateMainIndexesQuoteFailed(msg: e.toString()));
  }
}