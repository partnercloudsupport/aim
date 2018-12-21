import '../../models.dart';


class StateNewsCategories {
  String status;

  int selected;
  List<ModelNewsCategory> categories;

  StateNewsCategories({this.status, this.selected, this.categories});

  int get length => categories.length;
}


class StateNewsItems {
  List<ModelNewsItem> items;
  StateNewsItems({this.items});
}
