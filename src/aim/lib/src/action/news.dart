import '../model/news.dart';


// get news categories
class ActionGetNewsCategories{}

class ActionGetNewsCategoriesSucceed{
  final List<ModelNewsCategory> categories;
  ActionGetNewsCategoriesSucceed({this.categories});
}

class ActionGetNewsCategoriesFailed {
  final String error;
  ActionGetNewsCategoriesFailed(this.error);
}
