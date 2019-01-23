import '../../model/index.dart';


// action for loading main indexes
class ActionLoadMainIndexes {}

class ActionLoadMainIndexesSucceed {
  ModelIndexes indexes;
  ModelIndexQuotes quotes;
  ActionLoadMainIndexesSucceed({this.indexes, this.quotes});
}

class ActionLoadMainIndexesFailed {
  final String msg;
  ActionLoadMainIndexesFailed({this.msg});
}


// action for update main indexes's quote
class ActionUpdateMainIndexesQuote {}

class ActionUpdateMainIndexesQuoteSucceed {
  ModelIndexQuotes quotes;
  ActionUpdateMainIndexesQuoteSucceed({this.quotes});
}

class ActionUpdateMainIndexesQuoteFailed {
  final String msg;
  ActionUpdateMainIndexesQuoteFailed({this.msg});
}
