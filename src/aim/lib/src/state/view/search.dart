import 'base.dart';
import '../model/stock.dart';


// market search data
class Search {
  // user search history
  SearchHistory history;
  // hottest search stocks
  SearchHottest hottest;
  // current search results
  SearchResults results;

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

  SearchHistory({this.stocks, Status status, String tip}): super(status: status, tip: tip);

  factory SearchHistory.init() {
    return SearchHistory(
      stocks: [],
    );
  }

  SearchHistory copyWith({List<String> stocks, Status status, String tip}) {
    return SearchHistory(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

class SearchHottest extends DataState {
  List<String> stocks;

  SearchHottest({this.stocks, Status status, String tip}): super(status: status, tip: tip);

  factory SearchHottest.init() {
    return SearchHottest(
      stocks: [],
    );
  }

  SearchHottest copyWith({List<String> stocks, Status status, String tip}) {
    return SearchHottest(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

class SearchResults extends DataState {
  List<String> stocks;

  SearchResults({this.stocks, Status status, String tip}): super(status: status, tip: tip);

  factory SearchResults.init() {
    return SearchResults(
      stocks: [],
    );
  }

  SearchResults copyWith({List<String> stocks, Status status, String tip}) {
    return SearchResults(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}
