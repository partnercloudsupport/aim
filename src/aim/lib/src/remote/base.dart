import 'package:dio/dio.dart';

import '../app.dart';
import '../model/protocol.dart';

class RemoteService {
  String _sid;
  final Dio _dio;
  RemoteService({String baseUrl}) : _dio=Dio(Options(baseUrl: baseUrl));

  Future get(String path, {dynamic data}) async {
    try{
      var response = await this._dio.get(path, data: _addPublicParams(data, this._sid));
      var presult = Protocol.fromJson(response.data);
      this._sid = presult.sid??this._sid;
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }

  Future post(String path, {dynamic data}) async {
    try{
      var response = await this._dio.post(path, data: _addPublicParams(data, this._sid));
      var presult = Protocol.fromJson(response.data);
      this._sid = presult.sid??this._sid;
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }

  static Map<String, dynamic> _addPublicParams(dynamic data, String sid) {
    if (data is Map<String, dynamic>) {
      var params = Map.of(data);
      params.addAll({'_app': App.code, '_platform': App.platform, '_version': App.version, '_sid':sid??''});
      return params;
    } else {
      return data;
    }
  }
}
