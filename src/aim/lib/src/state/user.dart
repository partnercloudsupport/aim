import 'base.dart';
export 'base.dart';
import '../model/user.dart';

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
class UserLogin extends DataState {
  // user object
  ModelUser user;

  UserLogin({this.user, DataStatus status, String tip}): super(status: status, tip: tip);

  factory UserLogin.init() {
    return UserLogin(
      status: DataStatus.toload
    );
  }

  UserLogin copyWith({ModelUser user, DataStatus status, String tip}){
    return UserLogin(
      user: user??this.user,
      status: status??this.status,
      tip: tip??this.tip
    );
  }

  bool get isLogin => user.isLogin;
}

//// user self selected stocks
class UserStocks extends DataState {
  // user optional stocks
  List<String> stocks;

  UserStocks({this.stocks, DataStatus status, String tip}): super(status: status, tip: tip);

  factory UserStocks.init() {
    return UserStocks(
      stocks: [],
      status: DataStatus.toload
    );
  }

  UserStocks copyWith({List<String> stocks, DataStatus status, String tip}) {
    return UserStocks(
      stocks: stocks??this.stocks,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}

