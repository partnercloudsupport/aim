import 'package:redux/redux.dart';

import '../state/market.dart';
import '../action/market.dart';


// reducer for loading main index action
final marketReducer = combineReducers<MarketState>([
  TypedReducer<MarketState, ActionLoadMarketData>(_loadMarketData),
  TypedReducer<MarketState, ActionLoadMarketDataSucceed>(_loadMarketDataSucceed),
  TypedReducer<MarketState, ActionLoadMarketDataFailed>(_loadMarketDataFailed),

  TypedReducer<MarketState, ActionUpdateMarketIndexesQuote>(_updateMarketIndexesQuote),
  TypedReducer<MarketState, ActionUpdateMarketIndexesQuoteSucceed>(_updateMarketIndexesQuoteSucceed),
  TypedReducer<MarketState, ActionUpdateMarketIndexesQuoteFailed>(_updateMarketIndexesQuoteFailed),
]);


MarketState _loadMarketData(MarketState state, ActionLoadMarketData action) {
  return state.copyWith(status: ActionStatus.doing);
}

MarketState _loadMarketDataSucceed(MarketState state, ActionLoadMarketDataSucceed action) {
  return state.copyWith(status: ActionStatus.done, indexes: action.indexes, stocks: action.stocks);
}

MarketState _loadMarketDataFailed(MarketState state, ActionLoadMarketDataFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}

MarketState _updateMarketIndexesQuote(MarketState state, ActionUpdateMarketIndexesQuote action) {
  return state;
}

MarketState _updateMarketIndexesQuoteSucceed(MarketState state, ActionUpdateMarketIndexesQuoteSucceed action) {
  return state.updateWith(indexes: action.indexes);
}

MarketState _updateMarketIndexesQuoteFailed(MarketState state, ActionUpdateMarketIndexesQuoteFailed action) {
  return state;
}
