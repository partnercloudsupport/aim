import 'package:redux/redux.dart';

import '../state/user.dart';
import '../action/user.dart';

// user login
final userLoginReducer = combineReducers<UserLogin>([
  TypedReducer<UserLogin, ActionUserLogin>(_userLogin),
  TypedReducer<UserLogin, ActionUserLoginSucceed>(_userLoginSucceed),
  TypedReducer<UserLogin, ActionUserLoginFailed>(_userLoginFailed),

  TypedReducer<UserLogin, ActionSessionLogin>(_sessionLogin),
  TypedReducer<UserLogin, ActionSessionLoginSucceed>(_sessionLoginSucceed),
  TypedReducer<UserLogin, ActionSessionLoginFailed>(_sessionLoginFailed),
]);

UserLogin _userLogin(UserLogin state, ActionUserLogin action) {
  return state.copyWith(status: DataStatus.loading);
}

UserLogin _userLoginSucceed(UserLogin state, ActionUserLoginSucceed action) {
  return state.copyWith(user: action.user, status: DataStatus.loaded);
}

UserLogin _userLoginFailed(UserLogin state, ActionUserLoginFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}

UserLogin _sessionLogin(UserLogin state, ActionSessionLogin action) {
  return state.copyWith(status: DataStatus.loading);
}

UserLogin _sessionLoginSucceed(UserLogin state, ActionSessionLoginSucceed action) {
  return state.copyWith(user: action.user, status: DataStatus.loaded);
}

UserLogin _sessionLoginFailed(UserLogin state, ActionSessionLoginFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}


// user stocks
final userStocksReducer = combineReducers<UserStocks>([
  TypedReducer<UserStocks, ActionGetUserStocks>(_getUserStocksData),
  TypedReducer<UserStocks, ActionGetUserStocksSucceed>(_getUserStocksDataSucceed),
  TypedReducer<UserStocks, ActionGetUserStocksFailed>(_getUserStocksDataFailed),

  TypedReducer<UserStocks, ActionSetUserStockSucceed>(_setUserStocksDataSuccess),
  TypedReducer<UserStocks, ActionSetUserStockFailed>(_setUserStocksDataFailed),
]);


UserStocks _getUserStocksData(UserStocks state, ActionGetUserStocks action) {
  return state.copyWith(status: DataStatus.loading);
}

UserStocks _getUserStocksDataSucceed(UserStocks state, ActionGetUserStocksSucceed action) {
  return state.copyWith(status: DataStatus.loaded, stocks: action.stocks?.map((stock){return stock.id;})?.toList());
}

UserStocks _getUserStocksDataFailed(UserStocks state, ActionGetUserStocksFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}

UserStocks _setUserStocksDataSuccess(UserStocks state, ActionSetUserStockSucceed action) {
  var stocks = state.stocks;
  if(stocks.contains(action.id)){
    stocks?.remove(action.id);
  } else {
    stocks?.add(action.id);
  }
  return state.copyWith(
    stocks: stocks,
  );
}

UserStocks _setUserStocksDataFailed(UserStocks state, ActionSetUserStockFailed action) {
  return state.copyWith();
}