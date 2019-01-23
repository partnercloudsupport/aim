import 'package:redux/redux.dart';

import '../states/news.dart';
import '../actions/news.dart';


// reducer for loading news categories action
final newsCategoriesReducer = combineReducers<StateNewsCategories>([
  TypedReducer<StateNewsCategories, ActionLoadNewsCategories>(_loadNewsCategories),
  TypedReducer<StateNewsCategories, ActionLoadNewsCategoriesSucceed>(_loadNewsCategoriesSucceed),
  TypedReducer<StateNewsCategories, ActionLoadNewsCategoriesFailed>(_loadNewsCategoriesFailed),
]);


StateNewsCategories _loadNewsCategories(StateNewsCategories state, ActionLoadNewsCategories action) {
  return state.copyWith(state: LState.loading());
}

StateNewsCategories _loadNewsCategoriesSucceed(StateNewsCategories state, ActionLoadNewsCategoriesSucceed action) {
  return state.copyWith(state: LState.loaded(), categories: action?.categories?.items.map((category){return StateNewsCategory(category: category);}).toList());
}

StateNewsCategories _loadNewsCategoriesFailed(StateNewsCategories state, ActionLoadNewsCategoriesFailed action) {
  return state.copyWith(state: LState.failed(action.msg));
}



