import 'package:dio/dio.dart';

import '../model/protocol.dart';
import '../model/news.dart';
import '../model/index.dart';
import '../model/stock.dart';

import 'config.dart';

// service for access aim
class AimService {
  static Dio _dio = Dio(Options(baseUrl: BaseUrl.AIM));

  static Future get(String path, {dynamic data}) async {
    try{
      var response = await _dio.get(path, data: data);
      var presult = Protocol.fromJson(response.data);
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }

  static Future post(String path, {dynamic data}) async {
    try{
      var response = await _dio.post(path, data: data);
      var presult = Protocol.fromJson(response.data);
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }
}

// service for access alm
class AlmService {
  static Dio _dio = Dio(Options(baseUrl: BaseUrl.ALM));

  static Future get(String path, {dynamic data}) async {
    try{
      var response = await _dio.get(path, data: data);
      var presult = Protocol.fromJson(response.data);
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }

  static Future post(String path, {dynamic data}) async {
    try{
      var response = await _dio.post(path, data: data);
      var presult = Protocol.fromJson(response.data);
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }
}


class RemoteService {
  // 获取资讯分类
  static Future<ModelNewsCategories> fetchNewsCategories() async {
    String path = '/news/categories';
    var data = await AlmService.get(path);
    return ModelNewsCategories.fromJson(data);
  }

  // 获取资讯列表
  static Future<ModelNewsItems> fetchNewsItems(String category, int page) async {
    String path = '/news/list';
    var params = {'category':category, 'page':page};
    var data = await AlmService.get(path, data:params);
    return ModelNewsItems.fromJson(data);
  }

  // 获取主要指数列表
  static Future<ModelIndexes> fetchMainIndexes() async {
    String path = '/index/main';
    var data = await AlmService.get(path);
    return ModelIndexes.fromJson(data);
  }

  // 获取股票行情
  static Future<ModelStocks> fetchStockQuotes(List<String> stockCodes) async {
    String path = '/stock/quote';
    var params = {'zqdm': stockCodes.join(',')};
    var data = await AlmService.get(path, data: params);
    return ModelStocks.fromJson(data);
  }

  // 获取指数行情
  static Future<ModelIndexes> fetchIndexQuotes(List<String> indexCodes) async {
    String path = '/index/quote';
    var params = {'zqdm': indexCodes.join(',')};
    var data = await AlmService.get(path, data: params);
    return ModelIndexes.fromJson(data);
  }
}
