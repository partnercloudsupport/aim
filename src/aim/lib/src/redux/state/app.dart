import 'news.dart';

export 'news.dart';

class AppState {
  int tabIndex;
  StateNewsCategories newsCategories;

  AppState({this.tabIndex=0, this.newsCategories});
}