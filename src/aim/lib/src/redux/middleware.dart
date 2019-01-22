import 'package:redux/redux.dart';

import 'actions/news.dart';
import 'actions/index.dart';

import 'middlewares/news.dart';
import 'middlewares/index.dart';

import 'state.dart';

final List<Middleware<StateApp>> appMiddleware = [
  TypedMiddleware<StateApp, ActionLoadNewsCategories>(fetchNewsCategories),
  TypedMiddleware<StateApp, ActionLoadMainIndexes>(fetchMainIndexes),
  TypedMiddleware<StateApp, ActionUpdateMainIndexesQuote>(updateMainIndexesQuote),
];
