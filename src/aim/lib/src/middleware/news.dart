import 'package:redux/redux.dart';

import '../state/app.dart';
import '../model/news.dart';
import '../action/news.dart';
import '../remote/service.dart';


void fetchNewsCategories(Store<StateApp> store, action, NextDispatcher dispatcher) async {
  // dispatch action
  dispatcher(action);

  try{
    // load news categories
    ModelNewsCategories categories = await RemoteService.fetchNewsCategories();
    store.dispatch(ActionLoadNewsCategoriesSucceed(categories: categories));
  } catch(e) {
    store.dispatch(ActionLoadNewsCategoriesFailed(msg: e.toString()));
  }
}
