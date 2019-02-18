import '../model/index.dart';
import '../model/quote.dart';

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
