import 'package:redux/redux.dart';

import '../state/app.dart';
import '../remote/all.dart';
import '../model/index.dart';
import '../model/stock.dart';
import '../action/market.dart';


void loadMarketData(Store<AppState> store, action, NextDispatcher dispatcher) async {
  try{
    // get main indexes
    List<ModelIndex> indexes = await Remote.smds.getMainIndexes();
    // get user stocks
    List<ModelStock> stocks = await Remote.user.getUserStocks();
    // load market data succeed
    store.dispatch(ActionLoadMarketDataSucceed(indexes: indexes, stocks: stocks));
  } catch(e) {
    // load market data failed
    store.dispatch(ActionLoadMarketDataFailed(error: e.toString()));
  }
}


void updateMarketIndexesQuote(Store<AppState> store, action, NextDispatcher dispatcher) async {
  try {
    var indexCodes = Selectors.market(store.state).indexCodes();
    List<ModelIndex> indexes = await Remote.smds.getIndexQuotes(indexCodes);
    store.dispatch(ActionUpdateMarketIndexesQuoteSucceed(indexes: indexes));
  }catch(e) {
    store.dispatch(ActionUpdateMarketIndexesQuoteFailed(error: e.toString()));
  }
}