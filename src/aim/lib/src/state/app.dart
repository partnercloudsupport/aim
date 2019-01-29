import 'user.dart';
import 'launch.dart';
import 'market.dart';
import 'upgrade.dart';

// app home tabs
enum AppTab{news, market, trade, mine}

// app state
class AppState {
  // current app active tab
  AppTab tab;

  // current user
  UserState user;
  // launch state
  LaunchState launch;
  // market page state
  MarketState market;
  // upgrade information
  UpgradeState upgrade;

  AppState({this.tab, this.user, this.launch, this.market, this.upgrade});

  factory AppState.init() {
    return AppState(
      tab: AppTab.news,
      user: UserState.init(),
      launch: LaunchState.init(),
      market: MarketState.init(),
      upgrade: UpgradeState.init(),
    );
  }
}

/// selectors for extract data from apps state
class Selectors{
  static LaunchState launch(AppState state) => state?.launch;
  static MarketState market(AppState state) => state?.market;
}
