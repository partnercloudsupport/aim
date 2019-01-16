import '../../model/stock.dart';
import 'base.dart';

class UserState {
  OptionalStocksState optionalStocksState;

  UserState({this.optionalStocksState});
  UserState.init() {
    optionalStocksState = OptionalStocksState.init();
  }
}


class OptionalStocksState extends BaseState {
  ModelStocks stocks;

  OptionalStocksState({Status status, String msg, this.stocks}): super(status: status, msg: msg);
  OptionalStocksState.init();
}
