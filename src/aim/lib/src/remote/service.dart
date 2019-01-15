import 'package:dio/dio.dart';

import '../model/protocol.dart';
import '../model/index.dart';
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
  // 获取主要指数列表
  static Future<ModelMainIndexes> fetchMainIndexes() async {
    String path = '/index/main';
    var data = await AlmService.get(path);
    return ModelMainIndexes.fromJson(data);
  }

  // 获取指定指数行情列表
  static Future<ModelIndexQuotes> fetchIndexQuotes(List<String> indexCodes) async {
    String path = '/index/quote';
    var params = {'zqdm': indexCodes.join(',')};
    var data = await AlmService.get(path, data: params);
    return ModelIndexQuotes.fromJson(data);
  }
}
