import 'base.dart';
export 'base.dart';
import '../model/stock.dart';

// market search data
class Search {
  // user search history
  final SearchHistory history;
  // hottest search stocks
  final SearchHottest hottest;
  // current search results
  final SearchResults results;

  Search({this.history, this.hottest, this.results});

  factory Search.init() {
    return Search(
      history: SearchHistory.init(),
      hottest: SearchHottest.init(),
      results: SearchResults.init()
    );
  }
}

class SearchHistory extends DataState {
  List<String> stocks;

  SearchHistory({this.stocks, DataStatus status, String tip}): super(status: status, tip: tip);

  factory SearchHistory.init() {
    return SearchHistory(
      stocks: [],
      status: DataStatus.toload
    );
  }

  SearchHistory copyWith({List<String> stocks, DataStatus status, String tip}) {
    return SearchHistory(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

class SearchHottest extends DataState {
  List<String> stocks;

  SearchHottest({this.stocks, DataStatus status, String tip}): super(status: status, tip: tip);

  factory SearchHottest.init() {
    return SearchHottest(
      stocks: [],
      status: DataStatus.toload
    );
  }

  SearchHottest copyWith({List<String> stocks, DataStatus status, String tip}) {
    return SearchHottest(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

class SearchResults extends DataState {
  // search words
  final String words;
  // search results
  final List<ModelStock> stocks;

  SearchResults({this.words, this.stocks, DataStatus status, String tip}): super(status: status, tip: tip);

  factory SearchResults.init() {
    return SearchResults(
      words: null,
      stocks: [],
      status: DataStatus.loaded
    );
  }

  SearchResults copyWith({String words, List<ModelStock> stocks, DataStatus status, String tip}) {
    return SearchResults(
      words: words,
      stocks: stocks??[],
      status: status??DataStatus.toload,
      tip: tip
    );
  }
}
