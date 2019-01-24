import 'user.dart';
import 'news.dart';
import 'index.dart';


class StateApp {
  StateUser user;
  StateNews news;

  StateIndexes indexes;

  StateApp({this.user, this.news, this.indexes});

  factory StateApp.init() => StateApp(
      user: StateUser.init(),
      news: StateNews.init(),
      indexes: StateIndexes.init()
  );
}