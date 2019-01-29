import '../model/index.dart';
import '../model/stock.dart';

/// action for loading market data
class ActionLoadMarketData {}

class ActionLoadMarketDataSucceed {
  List<ModelIndex> indexes;
  List<ModelStock> stocks;
  ActionLoadMarketDataSucceed({this.indexes, this.stocks});
}

class ActionLoadMarketDataFailed {
  final String error;
  ActionLoadMarketDataFailed({this.error});
}


/// action for updating market indexes data
class ActionUpdateMarketIndexesQuote {}

class ActionUpdateMarketIndexesQuoteSucceed {
  List<ModelIndex> indexes;
  ActionUpdateMarketIndexesQuoteSucceed({this.indexes});
}

class ActionUpdateMarketIndexesQuoteFailed {
  final String error;
  ActionUpdateMarketIndexesQuoteFailed({this.error});
}
