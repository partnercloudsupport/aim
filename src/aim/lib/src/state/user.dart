import 'base.dart';
export 'base.dart';
import '../model/user.dart';
import '../model/stock.dart';
import '../model/quote.dart';

class User {
  // user login state
  UserLogin login;
  // user self-selected stocks
  UserStocks stocks;

  User({this.login, this.stocks});

  factory User.init() {
    return User(
      login: UserLogin.init(),
      stocks: UserStocks.init(),
    );
  }

  User copyWith({UserLogin login, UserStocks stocks}){
    return User(
      login: login??this.login,
      stocks: stocks??this.stocks,
    );
  }

  bool get isLogin => login.isLogin;
}

//// user login state
class UserLogin extends StateBase {
  // user object
  ModelUser user;

  UserLogin({this.user, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory UserLogin.init() {
    return UserLogin(
      status: ActionStatus.todo
    );
  }

  UserLogin copyWith({ModelUser user, ActionStatus status, String tip}){
    return UserLogin(
      user: user??this.user,
      status: status??this.status,
      tip: tip??this.tip
    );
  }

  bool get isLogin => user.isLogin;
}

//// user self selected stocks
class UserStocks extends StateBase {
  // user optional stocks
  List<String> stocks;

  UserStocks({this.stocks, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory UserStocks.init() {
    return UserStocks(
      stocks: [],
      status: ActionStatus.todo
    );
  }

  UserStocks copyWith({List<String> stocks, ActionStatus status, String tip}) {
    return UserStocks(
      stocks: stocks??this.stocks,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}

