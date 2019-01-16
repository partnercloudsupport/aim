import 'base.dart';
import '../../model/news.dart';

export 'base.dart';

class NewsState  {
  // news categories
  NewsCategoriesState categoriesState;

  NewsState({this.categoriesState});
  NewsState.init() {
    categoriesState = NewsCategoriesState.init();
  }
}


class NewsCategoriesState extends BaseState{
  ModelNewsCategories categories;

  NewsCategoriesState({Status status, String msg, this.categories}): super(status: status, msg: msg);
  NewsCategoriesState.init();
}

