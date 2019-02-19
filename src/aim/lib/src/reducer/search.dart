import 'package:redux/redux.dart';
import '../state/search.dart';
import '../action/search.dart';

// search history
final searchHistoryReducer = combineReducers<SearchHistory>([
  TypedReducer<SearchHistory, ActionGetSearchHistory>(_getSearchHistory),
  TypedReducer<SearchHistory, ActionGetSearchHistorySucceed>(_getSearchHistorySucceed),
  TypedReducer<SearchHistory, ActionGetSearchHistoryFailed>(_getSearchHistoryFailed),
]);

SearchHistory _getSearchHistory(SearchHistory state, ActionGetSearchHistory action) {
  return state.copyWith(status: DataStatus.loading);
}

SearchHistory _getSearchHistorySucceed(SearchHistory state, ActionGetSearchHistorySucceed action) {
  return state.copyWith(stocks: action.stocks, status: DataStatus.loaded);
}

SearchHistory _getSearchHistoryFailed(SearchHistory state, ActionGetSearchHistoryFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}


// search hottest
final searchHottestReducer = combineReducers<SearchHottest>([
  TypedReducer<SearchHottest, ActionGetSearchHottest>(_getSearchHottest),
  TypedReducer<SearchHottest, ActionGetSearchHottestSucceed>(_getSearchHottestSucceed),
  TypedReducer<SearchHottest, ActionGetSearchHottestFailed>(_getSearchHottestFailed),
]);

SearchHottest _getSearchHottest(SearchHottest state, ActionGetSearchHottest action) {
  return state.copyWith(status: DataStatus.loading);
}

SearchHottest _getSearchHottestSucceed(SearchHottest state, ActionGetSearchHottestSucceed action) {
  List<String> stocks = action.stocks?.map((stock)=>stock.id)?.toList()??[];
  return state.copyWith(stocks: stocks, status: DataStatus.loaded);
}

SearchHottest _getSearchHottestFailed(SearchHottest state, ActionGetSearchHottestFailed action) {
  return state.copyWith(status: DataStatus.failed, tip: action.error);
}

// search results
final searchResultsReducer = combineReducers<SearchResults>([
  TypedReducer<SearchResults, ActionGetSearchResults>(_getSearchResults),
  TypedReducer<SearchResults, ActionGetSearchResultsSucceed>(_getSearchResultsSucceed),
  TypedReducer<SearchResults, ActionGetSearchResultsFailed>(_getSearchResultsFailed),
  TypedReducer<SearchResults, ActionClearSearchResults>(_clearSearchResults),
]);

SearchResults _getSearchResults(SearchResults state, ActionGetSearchResults action) {
  return state.copyWith(words: action.words, status: DataStatus.loading);
}

SearchResults _getSearchResultsSucceed(SearchResults state, ActionGetSearchResultsSucceed action) {
  return state.copyWith(words: action.words, stocks: action.stocks, status: DataStatus.loaded);
}

SearchResults _getSearchResultsFailed(SearchResults state, ActionGetSearchResultsFailed action) {
  return state.copyWith(words: action.words, status: DataStatus.failed, tip: action.error);
}

SearchResults _clearSearchResults(SearchResults state, ActionClearSearchResults action) {
  return SearchResults.init();
}
