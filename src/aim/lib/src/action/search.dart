import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';

// action for get user search history
class ActionGetSearchHistory {}

class ActionGetSearchHistorySucceed {
  List<String> stocks;
  ActionGetSearchHistorySucceed({this.stocks});
}

class ActionGetSearchHistoryFailed {
  final String error;
  ActionGetSearchHistoryFailed({this.error});
}

// action for get hottest search stocks
class ActionGetSearchHottest {}

class ActionGetSearchHottestSucceed {
  List<ModelStock> stocks;
  ActionGetSearchHottestSucceed({this.stocks});
}

class ActionGetSearchHottestFailed {
  final String error;
  ActionGetSearchHottestFailed({this.error});
}


// action for search stock by words(stock code/jianpin/quanpin)
class ActionGetSearchResults {
  final String words;
  ActionGetSearchResults({this.words});
}

class ActionGetSearchResultsSucceed{
  final String words;
  final List<ModelStock> stocks;
  ActionGetSearchResultsSucceed({this.words, this.stocks});
}

class ActionGetSearchResultsFailed {
  final String words;
  final String error;
  ActionGetSearchResultsFailed({this.words, this.error});
}
