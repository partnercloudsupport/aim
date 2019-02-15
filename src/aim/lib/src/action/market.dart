import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';

////////////////////////////////////////actions about index//////////////////////////////
/// action for get market indexes
class ActionGetIndexes {}

class ActionGetIndexesSucceed {
  List<ModelIndex> indexes;
  ActionGetIndexesSucceed({this.indexes});
}

class ActionGetIndexesFailed {
  final String error;
  ActionGetIndexesFailed({this.error});
}

/// action for get index detail
class ActionGetIndexDetail {
  final String id;
  ActionGetIndexDetail({this.id});
}

class ActionGetIndexDetailSucceed{
  final ModelIndexDetail index;
  ActionGetIndexDetailSucceed({this.index});
}

class ActionGetIndexDetailFailed {
  final String error;
  ActionGetIndexDetailFailed({this.error});
}

/// action for get index quote
class ActionGetIndexQuote {
  final String id;
  ActionGetIndexQuote({this.id});
}

class ActionGetIndexQuoteSucceed {
  final ModelQuote quote;
  ActionGetIndexQuoteSucceed({this.quote});
}

class ActionGetIndexQuoteFailed {
  final String error;
  ActionGetIndexQuoteFailed({this.error});
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

////////////////////////////////////////actions about stock//////////////////////////////
/// action for get market stocks
class ActionGetStocks {}

class ActionGetStocksSucceed {
  List<ModelIndex> indexes;
  ActionGetStocksSucceed({this.indexes});
}

class ActionGetStocksFailed {
  final String error;
  ActionGetStocksFailed({this.error});
}

/// action for get stock detail data
class ActionGetStockDetail {
  final String id;
  ActionGetStockDetail({this.id});
}

class ActionGetStockDetailSucceed{
  final ModelStockDetail stock;
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