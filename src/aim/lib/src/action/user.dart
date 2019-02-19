import '../model/user.dart';
import '../model/stock.dart';

// user login
class ActionUserLogin{
  final String user;
  final String pwd;
  ActionUserLogin({this.user, this.pwd});
}

class ActionUserLoginSucceed{
  final ModelUser user;
  ActionUserLoginSucceed({this.user});
}

class ActionUserLoginFailed {
  final String error;
  ActionUserLoginFailed({this.error});
}


// session login
class ActionSessionLogin{
  final ModelUser user;
  ActionSessionLogin({this.user});
}

class ActionSessionLoginSucceed{
  final ModelUser user;
  ActionSessionLoginSucceed({this.user});
}

class ActionSessionLoginFailed {
  final String error;
  ActionSessionLoginFailed({this.error});
}


// user stocks
class ActionGetUserStocks{}

class ActionGetUserStocksSucceed {
  List<ModelUserStock> stocks;
  ActionGetUserStocksSucceed({this.stocks});
}

class ActionGetUserStocksFailed {
  final String error;
  ActionGetUserStocksFailed({this.error});
}


// user collection
class ActionSetUserStock{
  final String id;
  final String name;
  ActionSetUserStock({this.id, this.name});
}

class ActionSetUserStockSucceed {
  final String id;
  ActionSetUserStockSucceed({this.id});
}

class ActionSetUserStockFailed {
  final String id;
  final String error;
  ActionSetUserStockFailed({this.id, this.error});
}
