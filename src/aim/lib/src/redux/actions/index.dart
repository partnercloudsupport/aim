import '../../models.dart';


// action for loading main indexes
class ActionLoadMainIndexes {}

class ActionLoadMainIndexesSucceed {
  ModelIndexes indexes;
  ActionLoadMainIndexesSucceed({this.indexes});
}

class ActionLoadMainIndexesFailed {
  final String msg;
  ActionLoadMainIndexesFailed({this.msg});
}

// action for update main indexes's quote
class ActionUpdateMainIndexesQuote {}

class ActionUpdateMainIndexesQuoteSucceed {
  ModelIndexes indexes;
  ActionUpdateMainIndexesQuoteSucceed({this.indexes});
}

class ActionUpdateMainIndexesQuoteFailed {
  final String msg;
  ActionUpdateMainIndexesQuoteFailed({this.msg});
}
