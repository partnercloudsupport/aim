import 'config.dart';
import 'local/all.dart';
import 'remote/all.dart';

/// app global information
class App {
  static final String code = 'aim';
  static final String platform = 'ios';
  static final String version = '1.0.0.23';

  static Future<void> init() async {
    // init local storage
    await Local.init();
    // init app configure
    await Config.init();
    // init remote service
    await Remote.init(Config.app);
  }
}
