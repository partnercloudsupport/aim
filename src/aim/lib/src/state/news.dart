import 'base.dart';
export 'base.dart';
import '../model/news.dart';

// news data
class News {
  final NewsCategories categories;

  News({this.categories});

  factory News.init() {
    return News(
      categories: NewsCategories.init()
    );
  }
}

// news categories data
class NewsCategories extends DataState {
  // current selected index of category list
  final int selected;
  // news category list
  final List<ModelNewsCategory> categories;

  NewsCategories({this.selected, this.categories, DataStatus status, String tip}): super(status: status, tip: tip);

  factory NewsCategories.init() {
    return NewsCategories(
      selected: 0,
      categories: [],
      status: DataStatus.toload
    );
  }

  NewsCategories copyWith({int selected, List<ModelNewsCategory> categories, DataStatus status, String tip}) {
    return NewsCategories(
      selected: selected??this.selected,
      categories: categories??this.categories,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}
