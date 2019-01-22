import 'base.dart';
import '../../model/news.dart';

export 'base.dart';

// 资讯
class StateNews{
  StateNewsCategories categories;

  StateNews({this.categories});
  factory StateNews.init() => StateNews(
    categories: StateNewsCategories.init()
  );
}

// 资讯-类别
class StateNewsCategories {
  State state;
  List<StateNewsCategory> categories;

  StateNewsCategories({this.state, this.categories});

  factory StateNewsCategories.init() => StateNewsCategories(
    state: State.init(),
    categories: []
  );

  StateNewsCategories copyWith({State state, List<StateNewsCategory> categories}) {
    return StateNewsCategories(state: state??this.state, categories: categories??this.categories);
  }
}

// 资讯-类别-列表
class StateNewsCategory {
  ModelNewsCategory category;
  StateNewsItems stateItems;

  StateNewsCategory({this.category, this.stateItems});
}

// 资讯-类别-列表-条目
class StateNewsItems {
  int total;
  int page;
  List<ModelNewsItem> items;

  StateNewsItems({this.total, this.page, this.items});
}
