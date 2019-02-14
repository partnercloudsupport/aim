import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';


/// action for get main index
class ActionGetIndexes {}

class ActionGetIndexesSucceed {
  List<ModelIndex> indexes;
  ActionGetIndexesSucceed({this.indexes});
}

class ActionGetIndexesFailed {
  final String error;
  ActionGetIndexesFailed({this.error});
}


/// action for get indexes quote
class ActionGetIndexesQuote {
  List<String> indexes;
  ActionGetIndexesQuote({this.indexes});
}

class ActionGetIndexesQuoteSucceed {
  List<ModelQuote> quotes;
  ActionGetIndexesQuoteSucceed({this.quotes});
}

class ActionGetIndexesQuoteFailed {
  final String error;
  ActionGetIndexesQuoteFailed({this.error});
}


// action for search stock
class ActionSearchStock {
  final String words;
  ActionSearchStock({this.words});
}

class ActionSearchStockSucceed{
  final List<String> stocks;
  ActionSearchStockSucceed({this.stocks});
}

class ActionSearchStockFailed {
  final String error;
  ActionSearchStockFailed({this.error});
}
