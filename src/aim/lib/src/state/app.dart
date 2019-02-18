import 'base.dart';
export 'base.dart';
import '../model/launch.dart';

class AppData {
  // app selected tab
  AppTab tab;
  // app launch state
  AppLaunch launch;
  // app upgrade state
  AppUpgrade upgrade;

  AppData({this.tab, this.launch, this.upgrade});
  factory AppData.init() {
    return AppData(
      tab: AppTab.news,
      launch: AppLaunch.init(),
      upgrade: AppUpgrade.init()
    );
  }
}

// app tab
enum AppTab{news, market, trade, mine}

// app launch state
class AppLaunch extends DataState {
  // launch config
  LaunchConfig config;
  // launch finished
  bool finished;

  AppLaunch({this.config, this.finished, DataStatus status, String tip}): super(status: status, tip: tip);

  factory AppLaunch.init() {
    return AppLaunch(
      finished: false,
      status: DataStatus.toload
    );
  }

  AppLaunch copyWith({LaunchConfig config, bool finished, DataStatus status, String tip}) {
    return AppLaunch(
      config: config??this.config,
      finished: finished??this.finished,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}

// app upgrade state
class AppUpgrade extends DataState {
  bool canceled;
  AppUpgrade({this.canceled, DataStatus status, String tip}): super(status: status, tip: tip);

  factory AppUpgrade.init() {
    return AppUpgrade(
      canceled: false,
      status: DataStatus.toload
    );
  }
}
