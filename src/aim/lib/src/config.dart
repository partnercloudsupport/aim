import 'dart:convert';
import 'package:flutter/services.dart';
import 'logger.dart';
import 'assets.dart';
import 'local/all.dart';
import 'model/config.dart';
import 'model/launch.dart';

class Config {
  static Future<AppConfig> loadAppConfig(Local local) async {
    try {
      String config = await rootBundle.loadString(Assets.appConfig)??'{}';
      _defaultAppConfig.copyWith(AppConfig.fromJson(jsonDecode(config)));
    } catch (e) {
      Log.error(e);
    } finally {
      try {
        _defaultAppConfig.copyWith(local.sp.getAppConfig());
      } catch (e){
        Log.error(e);
      }
    }
    return _defaultAppConfig;
  }

  static Future<LaunchConfig> loadLaunchConfig(Local local) async {
    try {
      String config = await rootBundle.loadString(Assets.launchConfig)??'{}';
      _defaultLaunchConfig.copyWith(LaunchConfig.fromJson(jsonDecode(config)));
    } catch (e) {
      Log.error(e);
    } finally {
      try {
        _defaultLaunchConfig.copyWith(local.sp.getLaunchConfig());
      } catch (e){
        Log.error(e);
      }
    }
    return _defaultLaunchConfig;
  }
}

// default app config
AppConfig _defaultAppConfig = AppConfig(
  service: ServiceConfig(
    app: 'http://localhost:9004',
    user: 'http://localhost:9002',
    news: 'http://localhost:9004',
    smds: 'http://localhost:9004'
  )
);

// default launch config
LaunchConfig _defaultLaunchConfig = LaunchConfig(
  duration: 2,
  assetKey: Assets.imageLaunch,
);