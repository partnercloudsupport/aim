import '../state/app.dart';
import '../model/config.dart';
import '../model/launch.dart';

// action for change app tab
class ActionChangeAppTab {
  final AppTab tab;
  ActionChangeAppTab(this.tab);
}

// action for get app config
class ActionGetAppConfig {}
class ActionGetAppConfigSucceed {
  final AppConfig config;
  ActionGetAppConfigSucceed(this.config);
}
class ActionGetAppConfigFailed {
  final String error;
  ActionGetAppConfigFailed({this.error});
}

// action for get launch config
class ActionGetLaunchConfig {}
class ActionGetLaunchConfigSucceed {
  final LaunchConfig config;
  ActionGetLaunchConfigSucceed(this.config);
}
class ActionGetLaunchConfigFailed {
  final String error;
  ActionGetLaunchConfigFailed({this.error});
}

// action for app launch
class ActionAppLaunch{}
class ActionAppLaunchSucceed {
  final LaunchConfig config;
  ActionAppLaunchSucceed(this.config);
}
class ActionAppLaunchFailed {
  final String error;
  ActionAppLaunchFailed({this.error});
}
class ActionAppLaunchFinished{}