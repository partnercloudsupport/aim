import 'base.dart';
export 'base.dart';

import '../model/news.dart';

class NewsState extends StateBase {
  List<ModelNewsCategory> categories;

  NewsState({ActionStatus status, this.categories, String error}): super(status: status, error: error);

  factory NewsState.init() {
    return NewsState(
      status: ActionStatus.todo
    );
  }

  NewsState copyWith({ActionStatus status, List<ModelNewsCategory> categories, String error}) {
    return NewsState(
      status: status??this.status,
      categories: categories??this.categories,
      error: error??this.error
    );
  }
}