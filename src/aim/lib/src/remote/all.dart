import '../model/config.dart';
import '../logger.dart';

import 'app.dart';
import 'news.dart';
import 'smds.dart';
import 'user.dart';

class Remote {
  // app service
  AppService app;
  // news service
  NewsService news;
  // securities service
  SmdsService smds;
  // user service
  UserService user;

  Remote({this.app, this.news, this.smds, this.user});

  /// init remote service with app configure
  static Future<Remote> init(ServiceConfig cfg) async {
    return Remote(
      app: AppService(baseUrl: cfg.app)..usePersistCookie(),
      news: NewsService(baseUrl: cfg.news)..usePersistCookie(),
      smds: SmdsService(baseUrl: cfg.smds)..usePersistCookie(),
      user: UserService(baseUrl: cfg.user)..usePersistCookie(),
    );
  }
}
