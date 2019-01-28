import '../model/config.dart';
import '../logger.dart';

import 'conf.dart';
import 'news.dart';
import 'smds.dart';
import 'user.dart';

class Remote {
  // configure service for app
  static ConfService conf;
  // news service
  static NewsService news;
  // securities service
  static SmdsService smds;
  // user service
  static UserService user;


  /// init remote service with app configure
  static Future<void> init(AppConfig cfg) async {
    try{
      conf = ConfService(baseUrl: cfg.service.conf);
      news = NewsService(baseUrl: cfg.service.news);
      smds = SmdsService(baseUrl: cfg.service.smds);
      user = UserService(baseUrl: cfg.service.user);
    }catch(e){
      Log.fatal(e);
    }
  }
}
