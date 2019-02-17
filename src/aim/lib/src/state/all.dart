import 'app.dart';
import 'news.dart';
import 'user.dart';
import 'market.dart';
import 'search.dart';

// app state
class AppState {
  // app state
  AppData app;
  // user state
  User user;
  // news state
  News news;
  // market state
  Market market;
  // search state
  Search search;

  AppState({this.app, this.user, this.news, this.market, this.search});

  factory AppState.init() {
    return AppState(
      app: AppData.init(),
      user: User.init(),
      news: News.init(),
      market: Market.init(),
      search: Search.init()
    );
  }

  // app data selectors
  AppTab get appTab => app.tab;
  int get appTabIndex => app.tab.index;

  AppLaunch get appLaunch => app.launch;

  // users data selectors
  UserStocks get userStocks => user.stocks;

  // news data selectors
  NewsCategories get newsCategories => news.categories;

  // market data selectors
  MarketStocks get marketStocks => market.stocks;
  MarketStockDetail get marketStockDetail => market.stock;

  MarketIndexes get marketIndexes => market.indexes;
  MarketIndexDetail get marketIndexDetail => market.index;
}

