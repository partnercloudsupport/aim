import 'package:redux/redux.dart';

import '../state/app.dart';
import '../action/news.dart';

import '../../datas.dart';
import '../../models.dart';
import '../../remotes.dart' as remotes;


void getNewsCategories(Store<AppState> store, action, NextDispatcher dispatch) async {
  dispatch(action);
  try{
    List<ModelNewsCategory> categories = await remotes.getNewsCategories();
    store.dispatch(ActionLoadNewsCategoriesSucceed(categories: categories));
  } catch(e) {
    store.dispatch(ActionLoadNewsCategoriesFailed(failure: e.toString()));
  }
}

void getNewsItems(Store<AppState> store, action, NextDispatcher dispatch) async {
  dispatch(action);
  try{
    Future.delayed(Duration(seconds: 3)).then((value){
      store.dispatch(ActionLoadNewsItemsSucceed(items: TestData.newsItemsList));
    });
  } catch(e) {
    store.dispatch(ActionLoadNewsItemFailed(failure: e.toString()));
  }
}