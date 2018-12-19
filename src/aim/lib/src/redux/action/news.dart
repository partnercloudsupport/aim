import '../../models.dart';


class ActionLoadNewsCategories {}

class ActionLoadNewsCategoriesSucceed {
  List<ModelNewsCategory> categories;

  ActionLoadNewsCategoriesSucceed({this.categories});
}

class ActionLoadNewsCategoriesFailed {
  String failure;

  ActionLoadNewsCategoriesFailed({this.failure});
}


class ActionSwitchNewsCategories {
  int selected;

  ActionSwitchNewsCategories(this.selected);
}