import 'app.dart';
import 'user.dart';
import 'news.dart';
import 'index.dart';
import 'stock.dart';
import 'search.dart';

import '../state/all.dart';
import '../state/app.dart';
import '../state/user.dart';
import '../state/news.dart';
import '../state/market.dart';
import '../state/search.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    app: AppData(
      tab: appTabReducer(state.app.tab, action),
      launch: appLaunchReducer(state.app.launch, action),
      upgrade: appUpgradeReducer(state.app.upgrade, action)
    ),
    user: User(
      login: userLoginReducer(state.user.login, action),
      stocks: userStocksReducer(state.user.stocks, action)
    ),
    news: News(
      categories: newsCategoriesReducer(state.news.categories, action)
    ),
    market: Market(
      indexes: marketIndexesReducer(state.market.indexes, action),
      index:marketIndexDetailReducer(state.market.index, action),
      stocks: marketStocksReducer(state.market.stocks, action),
      stock: marketStockDetailReducer(state.market.stock, action)
    ),
    search: Search(
      history: searchHistoryReducer(state.search.history, action),
      hottest: searchHottestReducer(state.search.hottest, action),
      results: searchResultsReducer(state.search.results, action)
    )
  );
}
