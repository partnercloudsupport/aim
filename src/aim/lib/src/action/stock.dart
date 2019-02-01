import '../model/stock.dart';

class ActionGetStockDetail{
  final String zqdm;
  ActionGetStockDetail({this.zqdm});
}

class ActionGetStockDetailSucceed{
  final ModelStock detail;
  ActionGetStockDetailSucceed({this.detail});
}

class ActionGetStockDetailFailed {
  final String error;
  ActionGetStockDetailFailed({this.error});
}
