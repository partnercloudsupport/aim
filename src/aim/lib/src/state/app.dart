import 'user.dart';
import 'news.dart';
import 'index.dart';
import 'stock.dart';
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

  // stock detail page
  StockDetailState stock;

  AppState({this.tab, this.user, this.launch, this.news, this.market, this.upgrade, this.stock});

  factory AppState.init() {
    return AppState(
      tab: AppTab.news,
      user: UserState.init(),
      launch: LaunchState.init(),
      news: NewsState.init(),
      market: MarketState.init(),
      upgrade: UpgradeState.init(),
      stock: StockDetailState.init(),
    );
  }
}


class App {
  // app selected tab
  AppTab tab;
  // app launch state
  AppLaunchState launchState;
  // app upgrade state
  AppUpgradeState upgradeState;
}


// app tab
enum AppTab{news, market, trade, mine}

// app launch state
class AppLaunchState extends StateBase {
  // delay duration in seconds
  int duration;
  // local asset key
  String assetKey;
  // remote image url
  String imageUrl;

  // launch finished
  bool finished;

  AppLaunchState({ActionStatus status, this.duration, this.assetKey, this.imageUrl, this.finished, String error}): super(status: status, error: error);

  factory AppLaunchState.init() {
    return AppLaunchState(
        status: ActionStatus.todo,
        finished: false
    );
  }

  AppLaunchState copyWith({ActionStatus status, int duration, String assetKey, String imageUrl, bool finished, String error}) {
    return AppLaunchState(
        duration: duration??this.duration,
        status: status??this.status,
        assetKey: assetKey??this.assetKey,
        imageUrl: imageUrl??this.imageUrl,
        finished: finished??this.finished,
        error: error??this.error
    );
  }
}

// app upgrade state
class AppUpgradeState extends StateBase {
  bool canceled;
  AppUpgradeState({ActionStatus status, this.canceled, String error}): super(status: status, error: error);

  factory AppUpgradeState.init() {
    return AppUpgradeState(
        status: ActionStatus.todo
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

  static StockDetailState stock(AppState state) => state.stock;
}
