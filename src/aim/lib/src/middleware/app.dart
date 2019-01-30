import 'package:redux/redux.dart';

import 'user.dart';
import 'news.dart';
import 'market.dart';
import 'launch.dart';

import '../state/app.dart';
import '../action/all.dart';

final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionLaunch>(launchApp),

  TypedMiddleware<AppState, ActionUserLogin>(userLogin),
  TypedMiddleware<AppState, ActionSessionLogin>(sessionLogin),

  TypedMiddleware<AppState, ActionLoadNewsData>(loadNewsData),

  TypedMiddleware<AppState, ActionLoadMarketData>(loadMarketData),
  TypedMiddleware<AppState, ActionUpdateMarketIndexesQuote>(updateMarketIndexesQuote),
];
