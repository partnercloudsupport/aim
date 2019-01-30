import '../model/news.dart';

class ActionLoadNewsData{}

class ActionLoadNewsDataSucceed{
  final List<ModelNewsCategory> categories;
  ActionLoadNewsDataSucceed(this.categories);
}

class ActionLoadNewsDataFailed {
  final String error;
  ActionLoadNewsDataFailed(this.error);
}


