import 'base.dart';
export 'base.dart';

class App {
  // app selected tab
  AppTab tab;
  // app launch state
  AppLaunch launch;
  // app upgrade state
  AppUpgrade upgrade;

  App({this.tab, this.launch, this.upgrade});
  factory App.init() {
    return App(
      tab: AppTab.news,
      launch: AppLaunch.init(),
      upgrade: AppUpgrade.init()
    );
  }
}


// app tab
enum AppTab{news, market, trade, mine}

// app launch state
class AppLaunch extends StateBase {
  // delay duration in seconds
  int duration;
  // local asset key
  String assetKey;
  // remote image url
  String imageUrl;

  // launch finished
  bool finished;

  AppLaunch({this.duration, this.assetKey, this.imageUrl, this.finished, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory AppLaunch.init() {
    return AppLaunch(
        status: ActionStatus.todo,
        finished: false
    );
  }

  AppLaunch copyWith({int duration, String assetKey, String imageUrl, bool finished, ActionStatus status, String tip}) {
    return AppLaunch(
        duration: duration??this.duration,
        status: status??this.status,
        assetKey: assetKey??this.assetKey,
        imageUrl: imageUrl??this.imageUrl,
        finished: finished??this.finished,
        tip: tip??this.tip
    );
  }
}

// app upgrade state
class AppUpgrade extends StateBase {
  bool canceled;
  AppUpgrade({this.canceled, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory AppUpgrade.init() {
    return AppUpgrade(
        status: ActionStatus.todo
    );
  }
}

