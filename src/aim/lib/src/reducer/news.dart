import 'package:redux/redux.dart';

import '../state/news.dart';
import '../action/news.dart';


final newsReducer = combineReducers<NewsState>([
  TypedReducer<NewsState, ActionLoadNewsData>(_loadNewsData),
  TypedReducer<NewsState, ActionLoadNewsDataSucceed>(_loadNewsDataSucceed),
  TypedReducer<NewsState, ActionLoadNewsDataFailed>(_loadNewsDataFailed),
]);


NewsState _loadNewsData(NewsState state, ActionLoadNewsData action) {
  return state.copyWith(status: ActionStatus.doing);
}

NewsState _loadNewsDataSucceed(NewsState state, ActionLoadNewsDataSucceed action) {
  return state.copyWith(status: ActionStatus.done, categories: action.categories);
}

NewsState _loadNewsDataFailed(NewsState state, ActionLoadNewsDataFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}
