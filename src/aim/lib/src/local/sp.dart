import 'package:shared_preferences/shared_preferences.dart';

import '../logger.dart';

class StorageSharedPreferences {
  SharedPreferences preferences;

  /// init shared preferences
  void init() async {
    try{
      this.preferences = await SharedPreferences.getInstance();
    } catch(e) {
      Log.error(e);
    }
  }

  /// get app configure json string
  String getConfig() {
    return this.preferences.getString(_Keys.config);
  }
}

/// preferences keys
class _Keys {
  /// app configure
  static final config = 'config';
}
