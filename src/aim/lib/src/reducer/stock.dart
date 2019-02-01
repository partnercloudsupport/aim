import 'package:redux/redux.dart';

import '../state/stock.dart';
import '../action/stock.dart';


final stockDetailReducer = combineReducers<StockDetailState>([
  TypedReducer<StockDetailState, ActionGetStockDetail>(_userLogin),
  TypedReducer<StockDetailState, ActionGetStockDetailSucceed>(_userLoginSucceed),
  TypedReducer<StockDetailState, ActionGetStockDetailFailed>(_userLoginFailed),
]);


StockDetailState _userLogin(StockDetailState state, ActionGetStockDetail action) {
  return state.copyWith(status: ActionStatus.doing);
}

StockDetailState _userLoginSucceed(StockDetailState state, ActionGetStockDetailSucceed action) {
  return state.copyWith(status: ActionStatus.done, detail: action.detail);
}

StockDetailState _userLoginFailed(StockDetailState state, ActionGetStockDetailFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}
