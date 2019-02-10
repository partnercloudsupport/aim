import 'package:redux/redux.dart';

import '../state/stock.dart';
import '../action/stock.dart';


final stockDetailReducer = combineReducers<StockDetailState>([
  TypedReducer<StockDetailState, ActionGetStockDetail>(_getStockDetail),
  TypedReducer<StockDetailState, ActionGetStockDetailSucceed>(_getStockDetailSucceed),
  TypedReducer<StockDetailState, ActionGetStockDetailFailed>(_getStockDetailFailed),
]);


StockDetailState _getStockDetail(StockDetailState state, ActionGetStockDetail action) {
  return state.copyWith(status: ActionStatus.doing);
}

StockDetailState _getStockDetailSucceed(StockDetailState state, ActionGetStockDetailSucceed action) {
  return state.copyWith(status: ActionStatus.done, detail: action.detail);
}

StockDetailState _getStockDetailFailed(StockDetailState state, ActionGetStockDetailFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}
