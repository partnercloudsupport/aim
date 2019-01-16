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
