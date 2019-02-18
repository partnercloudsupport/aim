import 'package:redux/redux.dart';

import 'app.dart';
import 'user.dart';
import 'news.dart';
import 'index.dart';
import 'stock.dart';
import 'search.dart';

import '../state/all.dart';
import '../action/all.dart';

final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionAppLaunch>(appLaunch),

  TypedMiddleware<AppState, ActionUserLogin>(userLogin),
  TypedMiddleware<AppState, ActionSessionLogin>(sessionLogin),

  TypedMiddleware<AppState, ActionGetUserStocks>(getUserStocks),
  TypedMiddleware<AppState, ActionUserCollectStock>(setUserStock),

  TypedMiddleware<AppState, ActionGetNewsCategories>(getNewsCategories),

  TypedMiddleware<AppState, ActionGetStocks>(getAllStocks),
  TypedMiddleware<AppState, ActionGetStockDetail>(getStockDetail),
  TypedMiddleware<AppState, ActionGetStockQuote>(getStockQuote),
  TypedMiddleware<AppState, ActionGetStocksQuote>(getStocksQuote),

  TypedMiddleware<AppState, ActionGetIndexes>(getIndexes),
  TypedMiddleware<AppState, ActionGetIndexDetail>(getIndexDetail),
  TypedMiddleware<AppState, ActionGetIndexQuote>(getIndexQuote),
  TypedMiddleware<AppState, ActionGetIndexesQuote>(getIndexesQuote),

  TypedMiddleware<AppState, ActionGetSearchHistory>(getSearchHistory),
  TypedMiddleware<AppState, ActionGetSearchHottest>(getSearchHottest),
  TypedMiddleware<AppState, ActionGetSearchResults>(getSearchResults),
];
