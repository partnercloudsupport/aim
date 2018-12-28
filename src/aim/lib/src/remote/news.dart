import 'dart:core';
import 'dart:async';

import 'service.dart';
import '../models.dart';


Future<List<ModelNewsCategory>> getNewsCategories() async {
  String path =  '/news/categories';
  try{
    List<ModelNewsCategory> categories = [];
    var result = await alm.get(path);
    for (var item in result){
      categories.add(ModelNewsCategory.fromJson(item));
    }
    return categories;
  } catch(e) {
    rethrow;
  }
}


Future<List<ModelNewsItem>> getNewsItems(String category, int page) async {
  String path = '/news/list?category=$category&page=$page';
  try{
    List<ModelNewsItem> items = [];
    var result = await alm.get(path);
    for (var item in result){
      items.add(ModelNewsItem.fromJson(item));
    }
    return items;
  } catch(e) {
    rethrow;
  }
}


Future<ModelNewsDetail> getNewsDetail(String code) async{
  String path = '/news/detail?code=$code';
  try {
    var result = await alm.get(path);
    return ModelNewsDetail.fromJson(result);
  } catch(e) {
    rethrow;
  }
}
