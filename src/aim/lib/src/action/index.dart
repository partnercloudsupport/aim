import '../model/index.dart';


// action for loading main indexes
class ActionLoadMainIndexes {}

class ActionLoadMainIndexesSucceed {
  List<ModelIndex> indexes;
  ActionLoadMainIndexesSucceed({this.indexes});
}

class ActionLoadMainIndexesFailed {
  final String msg;
  ActionLoadMainIndexesFailed({this.msg});
}


// action for update main indexes's quote
class ActionUpdateMainIndexesQuote {}

class ActionUpdateMainIndexesQuoteSucceed {
  List<ModelIndex> indexes;
  ActionUpdateMainIndexesQuoteSucceed({this.indexes});
}

class ActionUpdateMainIndexesQuoteFailed {
  final String msg;
  ActionUpdateMainIndexesQuoteFailed({this.msg});
}
