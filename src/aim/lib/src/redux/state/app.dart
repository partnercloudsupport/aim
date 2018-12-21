import 'news.dart';

export 'news.dart';

class AppState {
  int tabIndex;
  StateNewsCategories newsCategories;
  StateNewsItems newsItems;

  AppState({this.tabIndex=0, this.newsCategories, this.newsItems});
}