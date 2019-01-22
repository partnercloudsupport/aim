import 'states/user.dart';
import 'states/news.dart';
import 'states/index.dart';

export 'states/user.dart';
export 'states/news.dart';
export 'states/index.dart';


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