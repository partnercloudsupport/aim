import 'package:redux/redux.dart';

import 'all.dart';

import '../state/app.dart';
import '../action/all.dart';

final List<Middleware<StateApp>> appMiddleware = [
  TypedMiddleware<StateApp, ActionLoadNewsCategories>(fetchNewsCategories),
  TypedMiddleware<StateApp, ActionLoadMainIndexes>(fetchMainIndexes),
  TypedMiddleware<StateApp, ActionUpdateMainIndexesQuote>(updateMainIndexesQuote),
];
