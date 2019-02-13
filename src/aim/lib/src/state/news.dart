import 'base.dart';
export 'base.dart';

import '../model/news.dart';

// news data
class News {
  NewsCategories categories;

  News({this.categories});

  factory News.init() {
    return News(
      categories: NewsCategories.init()
    );
  }
}

// news categories data
class NewsCategories extends StateBase {
  List<ModelNewsCategory> categories;

  NewsCategories({this.categories, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory NewsCategories.init() {
    return NewsCategories(
      categories: [],
      status: ActionStatus.todo
    );
  }

  NewsCategories copyWith({List<ModelNewsCategory> categories, ActionStatus status, String tip}) {
    return NewsCategories(
      categories: categories??this.categories,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}
