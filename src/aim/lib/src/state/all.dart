import 'app.dart';
import 'news.dart';
import 'user.dart';
import 'market.dart';

// app state
class AppState {
  // app state
  App app;
  // user state
  User user;
  // news state
  News news;
  // market state
  Market market;

  AppState({this.app, this.user, this.news, this.market});

  factory AppState.init() {
    return AppState(
      app: App.init(),
      user: User.init(),
      news: News.init(),
      market: Market.init(),
    );
  }
}
