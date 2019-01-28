import 'config.dart';
import 'local/all.dart';
import 'remote/all.dart';

class Launch {
  static Future<void> init() async {
    // init local storage
    await Local.init();
    // init app configure
    await Config.init();
    // init remote service
    await Remote.init(Config.app);
  }
}
