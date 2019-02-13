import 'package:redux/redux.dart';

import '../state/news.dart';
import '../action/news.dart';


// get news categories
final newsCategoriesReducer = combineReducers<NewsCategories>([
  TypedReducer<NewsCategories, ActionGetNewsCategories>(_getNewsCategoriesData),
  TypedReducer<NewsCategories, ActionGetNewsCategoriesSucceed>(_getNewsCategoriesDataSucceed),
  TypedReducer<NewsCategories, ActionGetNewsCategoriesFailed>(_getNewsCategoriesDataFailed),
]);

NewsCategories _getNewsCategoriesData(NewsCategories state, ActionGetNewsCategories action) {
  return state.copyWith(status: ActionStatus.doing);
}

NewsCategories _getNewsCategoriesDataSucceed(NewsCategories state, ActionGetNewsCategoriesSucceed action) {
  return state.copyWith(status: ActionStatus.done, categories: action.categories);
}

NewsCategories _getNewsCategoriesDataFailed(NewsCategories state, ActionGetNewsCategoriesFailed action) {
  return state.copyWith(status: ActionStatus.failed, tip: action.error);
}

