import 'package:redux/redux.dart';

import 'index.dart';
import 'news.dart';
import 'launch.dart';

import '../state/app.dart';
import '../action/all.dart';

final List<Middleware<StateApp>> appMiddleware = [
  TypedMiddleware<StateApp, ActionLaunch>(launchApp),

  TypedMiddleware<StateApp, ActionLoadNewsCategories>(fetchNewsCategories),

  TypedMiddleware<StateApp, ActionLoadMainIndexes>(fetchMainIndexes),
  TypedMiddleware<StateApp, ActionUpdateMainIndexesQuote>(updateMainIndexesQuote),

];
