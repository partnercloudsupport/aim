import 'dart:core';
import 'dart:async';
import '../models.dart' as models;


Future<List<models.NewsCategory>> getNewsCategories() {
  return Future.delayed(Duration(seconds: 5), () {
    List<models.NewsCategory> categories = [];
    for (var i=0; i<10; i++) {
      categories.add(models.NewsCategory('category'+i.toString(), '类别'+i.toString()));
    }
    return categories;
  });
}


Future<List<models.NewsItem>> getNewsItems(String category, int page) {
  return Future.delayed(Duration(seconds: 5), () {
    List<models.NewsItem> items = [];
    for (var i=0; i<10; i++) {
      items.add(models.NewsItem('item'+i.toString(), '这是一条类别是$category的新闻标题'+i.toString()));
    }
    return items;
  });
}


Future<models.NewsDetail> getNewsDetail(String code) {
  return Future.delayed(Duration(seconds: 5), () {
    return models.NewsDetail(code, '新闻代码为$code的标题', '这是新闻代码为$code的新闻内容');
  });
}