import 'dart:convert';
import 'package:flutter/services.dart';

import 'model/config.dart';
export 'model/config.dart';
import 'local/all.dart';
import 'remote/conf.dart';

import 'logger.dart';
import 'assets.dart';

class Config {
  static AppConfig app = _defaultAppConfig;

  static Future<void> init() async {
    try {
      AppConfig cfg= await loadFromAssets();
      app = app.copyWith(cfg);
    } catch (e) {
      Log.error(e);
    } finally {
      try {
        AppConfig cfg = await loadFromStorage();
        app = app.copyWith(cfg);
      } catch (e){
        Log.error(e);
      } finally {
        try {
          AppConfig cfg = await loadFromRemote();
          app = app.copyWith(cfg);
        } catch (e){
          Log.error(e);
        }
      }
    }
  }

  static Future<AppConfig> loadFromAssets() async {
    String strConfig = await rootBundle.loadString(Assets.appConfig);
    return AppConfig.fromJson(jsonDecode(strConfig??'{}'));
  }

  static Future<AppConfig> loadFromStorage() async {
    String strConfig = Local.sp.getConfig();
    return AppConfig.fromJson(jsonDecode(strConfig??'{}'));
  }

  static Future<AppConfig> loadFromRemote() async {
     return await ConfService(baseUrl: app.service.conf).getAppConfig();
  }

  static get launchDuration => app.launch.duration;
  static get launchImageUrl => app.launch.imageUrl;
  static get launchAssetKey => app.launch.assetKey;
}


// default app config
AppConfig _defaultAppConfig = AppConfig.initWith(
  launch: LaunchConfig.initWith(
    duration: 2,
    imageUrl: 'http://localhost:9004/files/image/launch.png',
    assetKey: 'res/image/launch.png'
  ),
  service: ServiceConfig.initWith(
    conf: 'http://localhost:9004',
    user: 'http://localhost:9002',
    news: 'http://localhost:9004',
    smds: 'http://localhost:9004'
  )
);