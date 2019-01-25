import 'user.dart';
import 'news.dart';
import 'index.dart';


// app state
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

// selectors for extract data from apps state
