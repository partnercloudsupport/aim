import 'package:redux/redux.dart';
import '../app.dart';
import '../model/user.dart';
import '../state/all.dart';
import '../action/user.dart';
import '../action/stock.dart';

Future<void> userLogin(Store<AppState> store, ActionUserLogin action, NextDispatcher next) async {
  try{
    // dispatch to next
    next(action);
    // user login
    ModelUser user = await App.remote.user.userLogin(action.user, action.pwd);
    // save to local
    await App.local.sp.setUser(user);
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
    ModelUser user = await App.remote.user.sessionLogin(action.user?.sid, action.user?.uid);
    // save to local
    await App.local.sp.setUser(user);
    // notify login success
    store.dispatch(ActionSessionLoginSucceed(user: user));
  } catch(e) {
    store.dispatch(ActionSessionLoginFailed(error: e.toString()));
  }
}

Future<void> getUserStocks(Store<AppState> store, ActionGetUserStocks action, NextDispatcher dispatcher) async {
  try{
    // get market stocks
    if(store.state?.market?.stocks?.stocks == null){
      store.dispatch(ActionGetStocks());
    }

    // get user stocks
    List<ModelUserStock> stocks;
    if(store.state?.user?.isLogin??false){
      stocks = await App.remote.user.getUserStocks();
    } else {
      stocks = await App.local.db.getUserStocks();
    }
    // get user stocks success
    store.dispatch(ActionGetUserStocksSucceed(stocks: stocks));
  } catch(e) {
    // get user stocks failed
    store.dispatch(ActionGetUserStocksFailed(error: e.toString()));
  }
}

Future<void> setUserStock(Store<AppState> store, ActionUserCollectStock action, NextDispatcher dispatcher) async {
  try{
    // set user collection
    if(store.state?.user?.isLogin??false){
      if(store.state.user?.stocks?.stocks?.contains(action.id)??false) {
        await App.local.db.addUserStock(action.id, '');
      } else {
        await App.local.db.removeUserStock(action.id);
      }
    } else {
      if(store.state.user?.stocks?.stocks?.contains(action.id)??false){
        await App.remote.user.addUserStock(action.id);
      } else{
        await App.remote.user.delUserStock(action.id);
      }
    }
    // get user stocks success
    store.dispatch(ActionUserCollectStockSucceed(id: action.id));
  } catch(e) {
    // get user stocks failed
    store.dispatch(ActionUserCollectStockFailed(id: action.id, error: e.toString()));
  }
}
