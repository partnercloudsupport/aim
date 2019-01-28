import 'user.dart';
import 'news.dart';
import 'index.dart';
import 'launch.dart';


/// app state
class StateApp {
  StateLaunch launch;

  StateUser user;
  StateNews news;

  StateIndexes indexes;

  StateApp({this.launch, this.user, this.news, this.indexes});

  factory StateApp.init() => StateApp(
    launch: StateLaunch.init(),
    user: StateUser.init(),
    news: StateNews.init(),
    indexes: StateIndexes.init()
  );
}


/// selectors for extract data from apps state
class Selectors{
  static StateLaunch launch(StateApp state) => state?.launch;
}
