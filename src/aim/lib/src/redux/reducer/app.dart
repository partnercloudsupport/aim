import '../state/app.dart';

import 'nav.dart';
import 'news.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    tabIndex: navReducer(state.tabIndex, action),
    newsCategories: newsCategoriesReducer(state.newsCategories, action),
    newsItems: newsItemsReducer(state.newsItems, action)
  );
}
