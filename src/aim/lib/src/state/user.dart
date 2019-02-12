import 'base.dart';
export 'base.dart';
import '../model/user.dart';
import '../model/stock.dart';
import '../model/quote.dart';

class UserState extends StateBase {
  // user login state
  UserLoginState loginState;
  // user self-selected stocks
  UserStocksState stocksState;

  UserState({this.loginState, this.stocksState, ActionStatus status, String error}): super(status: status, error: error);

  factory UserState.init() {
    return UserState(
      status: ActionStatus.todo
    );
  }

  UserState copyWith({UserLoginState loginState, UserStocksState stocksState, ActionStatus status, String error}){
    return UserState(
      status: status??this.status,
      loginState: loginState??this.loginState,
      stocksState: stocksState??this.stocksState,
      error: error??this.error
    );
  }

  bool get isLogin => loginState.isLogin;
}

//// user login state
class UserLoginState extends StateBase {
  // user object
  ModelUser user;

  UserLoginState({ActionStatus status, this.user, String error}): super(status: status, error: error);

  factory UserLoginState.init() {
    return UserLoginState(
        status: ActionStatus.todo
    );
  }

  UserLoginState copyWith({ActionStatus status, ModelUser user, String error}){
    return UserLoginState(
        status: status??this.status,
        user: user??this.user,
        error: error??this.error
    );
  }

  bool get isLogin => user.isLogin;
}

//// user self selected stocks
class UserStocksState extends StateBase {
  // user optional stocks
  List<ModelStock> stocks;

  UserStocksState({ActionStatus status, this.stocks, String error}): super(status: status, error: error);

  factory UserStocksState.init() {
    return UserStocksState(
        status: ActionStatus.todo
    );
  }

  UserStocksState copyWith({ActionStatus status, List<ModelStock> stocks, String error}) {
    return UserStocksState(
        status: status??this.status,
        stocks: stocks??this.stocks,
        error: error??this.error
    );
  }

  UserStocksState updateWith({List<ModelQuote> quotes}) {

  }

  List<String> stockCodes() {
    return this.stocks?.map((item){return item.zqdm;})?.toList();
  }
}

