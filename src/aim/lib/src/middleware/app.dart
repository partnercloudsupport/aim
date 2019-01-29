import 'package:redux/redux.dart';

import 'market.dart';
import 'launch.dart';

import '../state/app.dart';
import '../action/all.dart';

final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionLaunch>(launchApp),

  TypedMiddleware<AppState, ActionLoadMarketData>(loadMarketData),
  TypedMiddleware<AppState, ActionUpdateMarketIndexesQuote>(updateMarketIndexesQuote),
];
