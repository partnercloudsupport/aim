import 'all.dart';

import '../state/all.dart';



StateApp appReducer(StateApp state, action) {
  return StateApp(
    news: StateNews(
      categories: newsCategoriesReducer(state.news.categories, action),
    ),
    indexes: StateIndexes(
      mainIndexes:  mainIndexReducer(state.indexes.mainIndexes, action),
    ),
  );
}
