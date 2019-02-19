import 'db.dart';
import 'sp.dart';

class Local {
  // shared preference
  final StorageSharedPreferences sp;
  // sqlite database
  final StorageDB db;

  Local({this.sp, this.db});

  static Future<Local> init() async {
    return Local(
      sp: await StorageSharedPreferences().init(),
      db: await StorageDB().open()
    );
  }
}
