import '../../model/stock.dart';

import 'base.dart';


class StateUser {
  StateUserLogin login;
  StateUserStocks stocks;

  StateUser({this.login, this.stocks});
  factory StateUser.init() => StateUser(
    login: StateUserLogin.init(),
    stocks: StateUserStocks.init()
  );
}


class StateUserLogin{
  State state;

  int uid;
  String sid;

  StateUserLogin({this.state, this.uid, this.sid});
  factory StateUserLogin.init() => StateUserLogin(
    state: State.init()
  );
}

class StateUserStocks {
  State state;
  List<StateUserStock> stocks;

  StateUserStocks({this.state, this.stocks});
  factory StateUserStocks.init() => StateUserStocks(
    state: State.init(),
    stocks: []
  );
}

class StateUserStock {
  ModelStock stock;
  ModelStockQuote quote;

  StateUserStock({this.stock, this.quote});
}