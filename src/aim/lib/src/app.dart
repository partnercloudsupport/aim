import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'config.dart';
import 'state/all.dart';
import 'local/all.dart';
import 'remote/all.dart';
import 'model/config.dart';
import 'model/launch.dart';



/// app global information
class App {
  static final String code = 'aim';
  static final String platform = 'ios';
  static final String version = '1.0.0.23';

  // config for app
  static AppConfig config;
  // app launch config
  static LaunchConfig launch;

  // local storage for app
  static Local local;
  // remote service for app
  static Remote remote;

  static Future<void> init() async {
    // init local storage
    local = await Local.init();
    // init app config
    config = await Config.loadAppConfig(local);
    // init launch config
    launch = await Config.loadLaunchConfig(local);
    // init remote service
    remote = await Remote.init(config.service);
  }

  // dispatch an redux action
  static void dispatch(BuildContext context, dynamic action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  // push a new page
  static Future<T> push<T>(BuildContext context, dynamic page) async {
    if(page is String) {
      return await Navigator.of(context).pushNamed(page);
    } else if(page is Widget){
      return await Navigator.of(context).push(MaterialPageRoute(builder: (context){return page;}));
    } else {
      throw 'unsupported page type';
    }
  }

  // pop current page
  static bool pop<T>(BuildContext context, [T result]) {
    return Navigator.of(context).pop(result);
  }

  // push a replacement page
  static Future<T> pushReplace<T, T0>(BuildContext context, dynamic page, {T0 result}) async {
    if(page is String) {
      return await Navigator.of(context).pushReplacementNamed(page, result: result);
    } else if(page is Widget) {
      return await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return page;}), result: result);
    } else {
      throw 'unsupported page type';
    }
  }
}

