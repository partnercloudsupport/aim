import 'base.dart';
import '../../model/stock.dart';

class SearchHistoryModel extends ViewState {
  final List<ModelStock> stocks;

  SearchHistoryModel({this.stocks, ViewStatus status, String tip}): super(status: status, tip: tip);

  static SearchHistoryModel fromAppState(state) {
    return SearchHistoryModel(
        stocks: state.market?.stocks?.selectByIds(state.search?.history?.stocks),
        status: convertStatus(state.search?.history?.status),
        tip: state.search?.history?.tip
    );
  }
}

class SearchHottestModel extends ViewState {
  final List<ModelStock> stocks;

  SearchHottestModel({this.stocks, ViewStatus status, String tip}): super(status: status, tip: tip);

  static SearchHottestModel fromAppState(state) {
    return SearchHottestModel(
        stocks: state.market?.stocks?.selectByIds(state.search?.hottest?.stocks),
        status: convertStatus(state.search?.hottest?.status),
        tip: state.search?.hottest?.tip
    );
  }
}

class SearchResultsModel extends ViewState {
  final String words;
  final List<ModelStock> results;
  final List<String> collected;

  SearchResultsModel({this.words, this.results, this.collected, ViewStatus status, String tip}): super(status: status, tip: tip);

  static SearchResultsModel fromAppState(state) {
    return SearchResultsModel(
        words: state.search?.results?.words,
        results: state.search?.results?.stocks,
        collected: state.user?.stocks?.stocks,
        status: convertStatus(state.search?.results?.status),
        tip: state.search?.results?.tip
    );
  }
}