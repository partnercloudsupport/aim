import 'config.dart';
import 'local/all.dart';
import 'remote/all.dart';
import 'model/config.dart';
import 'model/launch.dart';

/// app global information
class App {
  static final String code = 'aim';
  static final String platform = 'ios';
  static final String version = '1.0.0.23';

  // global config for app
  static AppConfig config;
  // local storage for app
  static Local local;
  // remote service for app
  static Remote remote;

  static Future<void> init() async {
    // init local storage
    local = await Local.init();
    // init global config
    config = await Config.loadAppConfig(local);
    // init remote service
    remote = await Remote.init(config.service);
  }

  static Future<LaunchConfig> launchConfig() async {
    return await Config.loadLaunchConfig(local);
  }
}
