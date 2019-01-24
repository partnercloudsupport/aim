import '../model/news.dart';


// action for loading news category
class ActionLoadNewsCategories {}

class ActionLoadNewsCategoriesSucceed {
  ModelNewsCategories categories;
  ActionLoadNewsCategoriesSucceed({this.categories});
}

class ActionLoadNewsCategoriesFailed {
  final String msg;
  ActionLoadNewsCategoriesFailed({this.msg});
}


