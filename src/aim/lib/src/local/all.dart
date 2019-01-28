import 'db.dart';
import 'sp.dart';

class Local {
  static StorageSharedPreferences sp = StorageSharedPreferences();
  static StorageDB db = StorageDB();

  static Future<void> init() async {
    await sp.init();
    await db.init();
  }
}
