import 'state.dart';

import 'reducers/news.dart';
import 'reducers/index.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    news: NewsState(
      categoriesState: newsCategoriesReducer(state.news.categoriesState, action),
    ),
    indexes: IndexesState(
      mainIndexesState:  mainIndexReducer(state.indexes.mainIndexesState, action),
    ),
  );
}
