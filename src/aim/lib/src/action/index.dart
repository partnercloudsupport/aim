import '../model/index.dart';
import '../model/quote.dart';

/// action for loading index data
class ActionLoadIndexData {}

class ActionLoadIndexDataSucceed {
  List<ModelIndex> indexes;
  ActionLoadIndexDataSucceed({this.indexes});
}

class ActionLoadIndexDataFailed {
  final String error;
  ActionLoadIndexDataFailed({this.error});
}


/// action for update index quote
class ActionUpdateIndexQuote {}

class ActionUpdateIndexQuoteSucceed {
  List<ModelQuote> quotes;
  ActionUpdateIndexQuoteSucceed({this.quotes});
}

class ActionUpdateIndexQuoteFailed {
  final String error;
  ActionUpdateIndexQuoteFailed({this.error});
}
