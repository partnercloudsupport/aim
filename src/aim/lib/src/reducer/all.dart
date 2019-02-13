import 'app.dart';
import 'user.dart';
import 'news.dart';
import 'market.dart';

import '../state/all.dart';
import '../state/app.dart';
import '../state/user.dart';
import '../state/news.dart';
import '../state/market.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    app: App(
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
      index: MarketIndex(
        indexes: state.market.index.indexes,
        mainIndexes: marketMainIndexesReducer(state.market.index.mainIndexes, action)
      ),
      stock: MarketStock(
        stocks: state.market.stock.stocks,
      ),
      search: MarketSearch(

      )
    )
  );
}
