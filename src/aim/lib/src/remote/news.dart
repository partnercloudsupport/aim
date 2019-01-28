import 'base.dart';

import '../model/news.dart';

class NewsService extends RemoteService {
  NewsService({String baseUrl}): super(baseUrl: baseUrl);

  // 获取资讯分类
  Future<ModelNewsCategories> fetchNewsCategories() async {
    String path = '/news/categories';
    var data = await this.get(path);
    return ModelNewsCategories.fromJson(data);
  }

  // 获取资讯列表
  Future<ModelNewsItems> fetchNewsItems(String category, int page) async {
    String path = '/news/list';
    var params = {'category':category, 'page':page};
    var data = await this.get(path, data:params);
    return ModelNewsItems.fromJson(data);
  }
}
