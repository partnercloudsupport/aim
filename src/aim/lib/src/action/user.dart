import '../model/stock.dart';
import '../model/quote.dart';

//// user login
class ActionUserLogin{
  final String user;
  final String pwd;
  ActionUserLogin({this.user, this.pwd});
}

class ActionUserLoginSucceed{
  final String sid;
  final String uid;
  ActionUserLoginSucceed({this.sid, this.uid});
}

class ActionUserLoginFailed {
  final String error;
  ActionUserLoginFailed({this.error});
}


//// session login
class ActionSessionLogin{
  final String sid;
  final String uid;
  ActionSessionLogin({this.sid, this.uid});
}

class ActionSessionLoginSucceed{
  final String sid;
  final String uid;
  ActionSessionLoginSucceed({this.sid, this.uid});
}

class ActionSessionLoginFailed {
  final String error;
  ActionSessionLoginFailed({this.error});
}


//// user self selected stocks
class ActionLoadUserStocks{}

class ActionLoadUserStocksSucceed {
  List<ModelStock> stocks;
  ActionLoadUserStocksSucceed({this.stocks});
}

class ActionLoadUserStocksFailed {
  final String error;
  ActionLoadUserStocksFailed({this.error});
}


//// update user self selected stocks's quote
class ActionUpdateUserStocksQuote{}

class ActionUpdateUserStocksQuoteSucceed {
  List<ModelQuote> quotes;
  ActionUpdateUserStocksQuoteSucceed({this.quotes});
}

class ActionUpdateUserStocksQuoteFailed {
  final String error;
  ActionUpdateUserStocksQuoteFailed({this.error});
}
