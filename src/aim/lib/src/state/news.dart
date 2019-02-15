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
class NewsCategories extends DataState {
  List<ModelNewsCategory> categories;

  NewsCategories({this.categories, DataStatus status, String tip}): super(status: status, tip: tip);

  factory NewsCategories.init() {
    return NewsCategories(
      categories: [],
    );
  }

  NewsCategories copyWith({List<ModelNewsCategory> categories, DataStatus status, String tip}) {
    return NewsCategories(
      categories: categories??this.categories,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}
