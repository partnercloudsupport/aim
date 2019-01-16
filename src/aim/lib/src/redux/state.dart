import 'states/user.dart';
import 'states/news.dart';
import 'states/index.dart';

export 'states/user.dart';
export 'states/news.dart';
export 'states/index.dart';

class AppState {
  UserState user;
  NewsState news;
  IndexesState indexes;

  AppState({this.user, this.news, this.indexes});
  AppState.init() {
    this.user = UserState.init();
    this.news = NewsState.init();
    this.indexes = IndexesState.init();
  }
}