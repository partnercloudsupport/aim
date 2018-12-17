import 'dart:core';
import 'dart:async';

import 'package:dio/dio.dart';

import 'service.dart';
import '../models.dart' as models;


Future<List<models.NewsCategory>> getNewsCategories() async {
  String path =  '/news/categories';
  try{
    List<models.NewsCategory> categories = [];
    var result = await aim.get(path);
    for (var item in result){
      categories.add(models.NewsCategory.fromJson(item));
    }
    return categories;
  } catch(e) {
    rethrow;
  }
}


Future<List<models.NewsItem>> getNewsItems(String category, int page) async {
  String path = '/news/list?category=$category&page=$page';
  try{
    List<models.NewsItem> items = [];
    var result = await aim.get(path);
    for (var item in result){
      items.add(models.NewsItem.fromJson(item));
    }
    return items;
  } catch(e) {
    rethrow;
  }
}


Future<models.NewsDetail> getNewsDetail(String code) async{
  String path = '/news/detail?code=$code';
  try {
    var result = await aim.get(path);
    return models.NewsDetail.fromJson(result);
  } catch(e) {
    rethrow;
  }
}

void main() {
  print('start');
  getNewsCategories().then((lst) {
    print(lst);
  }).catchError((error){
    print(error);
  }).whenComplete((){
    print('completed');
  });
  print('end');
}