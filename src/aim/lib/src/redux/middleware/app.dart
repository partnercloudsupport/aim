import 'package:redux/redux.dart';

import '../state/app.dart';
import '../action/news.dart';

import 'news.dart';

final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionLoadNewsCategories>(getNewsCategories)
];