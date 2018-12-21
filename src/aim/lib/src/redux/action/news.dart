import '../../models.dart';


// load news category
class ActionLoadNewsCategories {}

class ActionLoadNewsCategoriesSucceed {
  List<ModelNewsCategory> categories;
  ActionLoadNewsCategoriesSucceed({this.categories});
}

class ActionLoadNewsCategoriesFailed {
  final String failure;
  ActionLoadNewsCategoriesFailed({this.failure});
}

// switch news category
class ActionSwitchNewsCategories {
  final int selected;
  ActionSwitchNewsCategories(this.selected);
}

// load news items
class ActionLoadNewsItems {
  final String category;
  ActionLoadNewsItems({this.category});
}

class ActionLoadNewsItemsSucceed {
  final List<ModelNewsItem> items;
  ActionLoadNewsItemsSucceed({this.items});
}

class ActionLoadNewsItemFailed {
  final String failure;
  ActionLoadNewsItemFailed({this.failure});
}
