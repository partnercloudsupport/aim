import 'package:redux/redux.dart';

import 'app.dart';
import 'user.dart';
import 'news.dart';
import 'market.dart';
import 'search.dart';

import '../state/all.dart';
import '../action/all.dart';

final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionLaunch>(launchApp),

  TypedMiddleware<AppState, ActionUserLogin>(userLogin),
  TypedMiddleware<AppState, ActionSessionLogin>(sessionLogin),

  TypedMiddleware<AppState, ActionLoadNewsData>(loadNewsData),

  TypedMiddleware<AppState, ActionGetStockDetail>(getStockDetail),

  TypedMiddleware<AppState, ActionLoadMarketData>(loadMarketData),
  TypedMiddleware<AppState, ActionUpdateMarketIndexesQuote>(updateMarketIndexesQuote),
];
