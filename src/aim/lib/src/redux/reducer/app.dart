import '../state/app.dart';

import 'nav.dart';
import 'news.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    tabIndex: navReducer(state.tabIndex, action),
    newsCategories: newsReducer(state.newsCategories, action)
  );
}
