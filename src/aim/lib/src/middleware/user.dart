import 'package:redux/redux.dart';
import '../local/all.dart';
import '../remote/all.dart';
import '../model/user.dart';
import '../model/stock.dart';
import '../state/all.dart';
import '../action/user.dart';

Future<void> userLogin(Store<AppState> store, ActionUserLogin action, NextDispatcher next) async {
  try{
    // dispatch to next
    next(action);
    // user login
    ModelUser user = await Remote.user.userLogin(action.user, action.pwd);
    // save to local
    await Local.sp.setUser(user);
    // notify login success
    store.dispatch(ActionUserLoginSucceed(user: user));
  } catch(e) {
    store.dispatch(ActionUserLoginFailed(error: e.toString()));
  }
}

Future<void> sessionLogin(Store<AppState> store, ActionSessionLogin action, NextDispatcher next) async {
  try{
    // dispatch to next
    next(action);
    // session login
    ModelUser user = await Remote.user.sessionLogin(action.user?.sid, action.user?.uid);
    // save to local
    await Local.sp.setUser(user);
    // notify login success
    store.dispatch(ActionSessionLoginSucceed(user: user));
  } catch(e) {
    store.dispatch(ActionSessionLoginFailed(error: e.toString()));
  }
}

Future<void> getUserStocks(Store<AppState> store, action, NextDispatcher dispatcher) async {
  try{
    // get user stocks
    List<ModelUserStock> stocks;
    if(store.state.user.isLogin){
      stocks = await Remote.user.getUserStocks();
    } else {
      stocks = await Local.db.getUserStocks();
    }
    // get user stocks success
    store.dispatch(ActionGetUserStocksSucceed(stocks: stocks));
  } catch(e) {
    // get user stocks failed
    store.dispatch(ActionGetUserStocksFailed(error: e.toString()));
  }
}