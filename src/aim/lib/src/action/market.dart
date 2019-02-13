import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';


/// action for get main index
class ActionGetMainIndexes {}

class ActionGetMainIndexesSucceed {
  List<ModelIndex> indexes;
  ActionGetMainIndexesSucceed({this.indexes});
}

class ActionGetMainIndexesFailed {
  final String error;
  ActionGetMainIndexesFailed({this.error});
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


// action for get stock detail data
class ActionGetStockDetail {
  final String id;
  ActionGetStockDetail({this.id});
}

class ActionGetStockDetailSucceed{
  final ModelStock stock;
  ActionGetStockDetailSucceed({this.stock});
}

class ActionGetStockDetailFailed {
  final String error;
  ActionGetStockDetailFailed({this.error});
}


/// action for get stock quote
class ActionGetStockQuote {
  final String id;
  ActionGetStockQuote({this.id});
}

class ActionGetStockQuoteSucceed {
  final ModelQuote quote;
  ActionGetStockQuoteSucceed({this.quote});
}

class ActionGetStockQuoteFailed {
  final String error;
  ActionGetStockQuoteFailed({this.error});
}

/// action for get stocks quote
class ActionGetStocksQuote {
  List<String> stocks;
  ActionGetStocksQuote({this.stocks});
}

class ActionGetStocksQuoteSucceed {
  List<ModelQuote> quotes;
  ActionGetStocksQuoteSucceed({this.quotes});
}

class ActionGetStocksQuoteFailed {
  final String error;
  ActionGetStocksQuoteFailed({this.error});
}