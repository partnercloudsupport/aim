import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../model/config.dart';
import '../model/launch.dart';

class StorageSharedPreferences {
  SharedPreferences preferences;

  /// init shared preferences
  Future<StorageSharedPreferences> init() async {
      this.preferences = await SharedPreferences.getInstance();
      return this;
  }

  /// get app configure json string
  AppConfig getAppConfig() {
    String str = this.preferences.getString(_Keys.appConfig);
    return AppConfig.fromJson(jsonDecode(str));
  }
  /// set app configure
  Future<bool> setAppConfig(AppConfig config) async {
    return await this.preferences.setString(_Keys.appConfig, jsonEncode(config.toJson()));
  }

  /// get app launch configure json string
  LaunchConfig getLaunchConfig() {
    String str = this.preferences.getString(_Keys.launchConfig);
    return LaunchConfig.fromJson(jsonDecode(str));
  }
  /// set config
  Future<bool> setLaunchConfig(LaunchConfig config) async {
    return await this.preferences.setString(_Keys.launchConfig, jsonEncode(config.toJson()));
  }

  /// get user information
  ModelUser getUser() {
    try{
      String strUser = this.preferences.getString(_Keys.user);
      return ModelUser.fromJson(jsonDecode(strUser??'{}'));
    } catch(e) {
      return ModelUser.fromJson({});
    }
  }

  /// set user information
  Future<bool> setUser(ModelUser user) async {
    try{
      String strUser = jsonEncode(user.toJson());
      return await this.preferences.setString(_Keys.user, strUser);
    }catch(e){
      return false;
    }
  }
}

/// preferences keys
class _Keys {
  /// app configure
  static final appConfig = 'config';
  /// launch configure
  static final launchConfig = 'launch';

  // app user information
  static final user = 'user';
}
