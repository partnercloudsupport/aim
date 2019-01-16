import 'package:redux/redux.dart';

import '../states/news.dart';
import '../actions/news.dart';


// reducer for loading news categories action
final newsCategoriesReducer = combineReducers<NewsCategoriesState>([
  TypedReducer<NewsCategoriesState, ActionLoadNewsCategories>(_loadNewsCategories),
  TypedReducer<NewsCategoriesState, ActionLoadNewsCategoriesSucceed>(_loadNewsCategoriesSucceed),
  TypedReducer<NewsCategoriesState, ActionLoadNewsCategoriesFailed>(_loadNewsCategoriesFailed),
]);


NewsCategoriesState _loadNewsCategories(NewsCategoriesState state, ActionLoadNewsCategories action) {
  return NewsCategoriesState(status: Status.loading);
}

NewsCategoriesState _loadNewsCategoriesSucceed(NewsCategoriesState state, ActionLoadNewsCategoriesSucceed action) {
  return NewsCategoriesState(status: Status.loaded, categories: action.categories);
}

NewsCategoriesState _loadNewsCategoriesFailed(NewsCategoriesState state, ActionLoadNewsCategoriesFailed action) {
  return NewsCategoriesState(status: Status.failed, msg: action.msg);
}



