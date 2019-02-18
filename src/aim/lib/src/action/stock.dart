import '../model/stock.dart';
import '../model/quote.dart';

/// action for get market stocks
class ActionGetStocks {}

class ActionGetStocksSucceed {
  List<ModelStock> stocks;
  ActionGetStocksSucceed({this.stocks});
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