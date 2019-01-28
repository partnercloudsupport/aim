import 'index.dart';
import 'news.dart';
import 'launch.dart';

import '../state/all.dart';


StateApp appReducer(StateApp state, action) {
  return StateApp(
    launch: launchReducer(state.launch, action),
    news: StateNews(
      categories: newsCategoriesReducer(state.news.categories, action),
    ),
    indexes: StateIndexes(
      mainIndexes:  mainIndexReducer(state.indexes.mainIndexes, action),
    ),
  );
}
