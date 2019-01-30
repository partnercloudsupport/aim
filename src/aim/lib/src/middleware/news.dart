import 'package:redux/redux.dart';

import '../state/app.dart';
import '../model/news.dart';
import '../action/news.dart';
import '../remote/all.dart';


Future<void> loadNewsData(Store<AppState> store, action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);
    // load news categories
    List<ModelNewsCategory> categories = await Remote.news.getNewsCategories();
    // dispatch succeed action
    store.dispatch(ActionLoadNewsDataSucceed(categories));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionLoadNewsDataFailed(e.toString()));
  }
}
