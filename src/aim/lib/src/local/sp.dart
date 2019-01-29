import 'package:shared_preferences/shared_preferences.dart';

import '../logger.dart';

class StorageSharedPreferences {
  SharedPreferences preferences;

  /// init shared preferences
  Future<void> init() async {
      this.preferences = await SharedPreferences.getInstance();
  }

  /// get app configure json string
  String getConfig() {
    return this.preferences.getString(_Keys.config);
  }
  /// set config
  Future<bool> setConfig(String value) async {
    return await this.preferences.setString(_Keys.config, value);
  }

  /// get user information
  String getUser() {
    return this.preferences.getString(_Keys.user);
  }

  /// set user information
  Future<bool> setUser(String value) async {
    return await this.preferences.setString(_Keys.user, value);
  }
}

/// preferences keys
class _Keys {
  /// app configure
  static final config = 'config';
  // app user information
  static final user = 'user';
}
