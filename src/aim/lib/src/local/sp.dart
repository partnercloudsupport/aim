import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

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
  static final config = 'config';
  // app user information
  static final user = 'user';
}
