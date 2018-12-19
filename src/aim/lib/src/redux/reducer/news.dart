import 'package:redux/redux.dart';

import '../state/news.dart';
import '../action/news.dart';



final newsReducer = combineReducers<StateNewsCategories>([
  TypedReducer<StateNewsCategories, ActionLoadNewsCategories>(_loadNewsCategories),
  TypedReducer<StateNewsCategories, ActionLoadNewsCategoriesSucceed>(_loadNewsCategoriesSucceed),
  TypedReducer<StateNewsCategories, ActionLoadNewsCategoriesFailed>(_loadNewsCategoriesFailed),
  TypedReducer<StateNewsCategories, ActionSwitchNewsCategories>(_switchNewsCategories),
]);


StateNewsCategories _loadNewsCategories(StateNewsCategories state, ActionLoadNewsCategories action) {
  return StateNewsCategories(status: 'loading');
}

StateNewsCategories _loadNewsCategoriesSucceed(StateNewsCategories state, ActionLoadNewsCategoriesSucceed action) {
  return StateNewsCategories(status: 'succeed', selected: 0, categories: action.categories);
}

StateNewsCategories _loadNewsCategoriesFailed(StateNewsCategories state, ActionLoadNewsCategoriesFailed action) {
  return StateNewsCategories(status: 'failed');
}

StateNewsCategories _switchNewsCategories(StateNewsCategories state, ActionSwitchNewsCategories action){
  return StateNewsCategories(status: state.status, selected: action.selected, categories: state.categories);
}