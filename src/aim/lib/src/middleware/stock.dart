import 'package:redux/redux.dart';

import '../state/app.dart';
import '../remote/all.dart';
import '../model/stock.dart';
import '../state/stock.dart';
import '../action/stock.dart';


Future<void> getStockDetail(Store<AppState> store, ActionGetStockDetail action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);
    // get stock detail
    ModelStock detail = await Remote.smds.getStockDetail(action.zqdm);
    // dispatch succeed action
    store.dispatch(ActionGetStockDetailSucceed(detail: detail));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionGetStockDetailFailed(error: e.toString()));
  }
}
