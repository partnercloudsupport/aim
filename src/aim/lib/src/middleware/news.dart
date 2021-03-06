import 'package:redux/redux.dart';

import '../app.dart';
import '../state/all.dart';
import '../model/news.dart';
import '../action/news.dart';


Future<void> getNewsCategories(Store<AppState> store, ActionGetNewsCategories action, NextDispatcher next) async {
  try{
    // dispatch next action
    next(action);
    // load news categories
    List<ModelNewsCategory> categories = await App.remote.news.getNewsCategories();
    // dispatch succeed action
    store.dispatch(ActionGetNewsCategoriesSucceed(categories: categories));
  }catch(e){
    // dispatch failed action
    store.dispatch(ActionGetNewsCategoriesFailed(e.toString()));
  }
}
