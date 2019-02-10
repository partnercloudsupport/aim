import 'user.dart';
import 'news.dart';
import 'stock.dart';
import 'market.dart';
import 'launch.dart';
import 'apptab.dart';

import '../state/all.dart';
import '../state/app.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    tab: appTabReducer(state.tab, action),
    launch: launchReducer(state.launch, action),
    user: userReducer(state.user, action),
    news: newsReducer(state.news, action),
    market: marketReducer(state.market, action),
    stock: stockDetailReducer(state.stock, action)
  );
}
