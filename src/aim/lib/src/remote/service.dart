import 'package:dio/dio.dart';

import '../model/protocol.dart';
import '../model/index.dart';
import '../model/news.dart';

import 'config.dart';

// service for access aim
class AimService {
  static Dio _dio = Dio(Options(baseUrl: BaseUrl.AIM));

  static Future get(String path, {dynamic data}) async {
    var response = await _dio.get(path, data: data);
    var presult = Protocol.fromJson(response.data);
    if (presult.status != 0){
      throw presult.msg;
    }
    return presult.data;
  }

  static Future post(String path, {dynamic data}) async {
    var response = await _dio.post(path, data: data);
    var presult = Protocol.fromJson(response.data);
    if (presult.status != 0){
      throw presult.msg;
    }
    return presult.data;
  }
}

// service for access alm
class AlmService {
  static Dio _dio = Dio(Options(baseUrl: BaseUrl.ALM));

  static Future get(String path, {dynamic data}) async {
    var response = await _dio.get(path, data: data);
    var presult = Protocol.fromJson(response.data);
    if (presult.status != 0){
      throw presult.msg;
    }
    return presult.data;
  }

  static Future post(String path, {dynamic data}) async {
    var response = await _dio.post(path, data: data);
    var presult = Protocol.fromJson(response.data);
    if (presult.status != 0){
      throw presult.msg;
    }
    return presult.data;
  }
}


class RemoteService {
  // 获取资讯分类
  static Future<ModelNewsCategories> fetchNewsCategories() async {
    String path = '/news/categories';
    var data = await AlmService.get(path);
    return ModelNewsCategories.fromJson(data);
  }

  // 获取主要指数列表
  static Future<ModelIndexes> fetchMainIndexes() async {
    String path = '/index/main';
    var data = await AlmService.get(path);
    return ModelIndexes.fromJson(data);
  }

  // 获取指定指数行情列表
  static Future<ModelIndexes> fetchIndexQuotes(List<String> indexCodes) async {
    String path = '/index/quote';
    var params = {'zqdm': indexCodes.join(',')};
    var data = await AlmService.get(path, data: params);
    return ModelIndexes.fromJson(data);
  }
}
