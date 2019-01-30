import 'user.dart';
import 'news.dart';
import 'launch.dart';
import 'market.dart';
import 'upgrade.dart';

import 'apptab.dart';
export 'apptab.dart';

// app state
class AppState {
  // current app active tab
  AppTab tab;

  // current user
  UserState user;
  // launch state
  LaunchState launch;

  // news page state
  NewsState news;
  // market page state
  MarketState market;
  // upgrade information
  UpgradeState upgrade;

  AppState({this.tab, this.user, this.launch, this.news, this.market, this.upgrade});

  factory AppState.init() {
    return AppState(
      tab: AppTab.news,
      user: UserState.init(),
      launch: LaunchState.init(),
      news: NewsState.init(),
      market: MarketState.init(),
      upgrade: UpgradeState.init(),
    );
  }
}

/// selectors for extract data from apps state
class Selector{
  static AppTab activeTab(AppState state) => state.tab;

  static bool isUserLogin(AppState state) => state.user.isLogin;
  static String getUID(AppState state) => state.user.uid;
  static String getSID(AppState state) => state.user.sid;

  static LaunchState launch(AppState state) => state.launch;

  static NewsState news(AppState state) => state.news;

  static MarketState market(AppState state) => state.market;
}
