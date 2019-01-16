import 'package:redux/redux.dart';

import 'state.dart';
import 'middlewares/news.dart';
import 'middlewares/index.dart';


final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionLoadNewsCategories>(fetchNewsCategories),
  TypedMiddleware<AppState, ActionLoadMainIndexes>(fetchMainIndexes),
];
