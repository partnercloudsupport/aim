import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';

// action for get user search history
class ActionGetSearchHistory {}

class ActionGetSearchHistorySucceed {
  List<ModelStock> stocks;
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
class ActionSearchStock {
  final String words;
  ActionSearchStock({this.words});
}

class ActionSearchStockSucceed{
  final List<ModelStock> stocks;
  ActionSearchStockSucceed({this.stocks});
}

class ActionSearchStockFailed {
  final String error;
  ActionSearchStockFailed({this.error});
}
