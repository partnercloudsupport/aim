import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../model/protocol.dart';

abstract class RemoteService {
  final Dio _dio;
  final Map _publicParams = {};

  RemoteService({String baseUrl}) : _dio=Dio(Options(baseUrl: baseUrl));

  Future get(String path, {dynamic data, Options options}) async {
    try{
      var response = await this._dio.get(path, data: _addPublicParams(data), options: options);
      var presult = Protocol.fromJson(response.data);
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }

  Future post(String path, {dynamic data, Options options}) async {
    try{
      if (data is Map){
        ContentType contentType = ContentType.parse('application/x-www-form-urlencoded');
        options = options?.merge(contentType: contentType)??Options(contentType: contentType);
      }

      var response = await this._dio.post(path, data: _addPublicParams(data), options: options);
      var presult = Protocol.fromJson(response.data);
      if (presult.status != 0){
        throw presult.msg;
      }
      return presult.data;
    } on DioError catch (e){
      throw '网络错误';
    }
  }

  void setPublicParams(String key, String value) {
    _publicParams[key] = value;
  }

  void delPublicParams(String key) {
    _publicParams.remove(key);
  }

  void usePersistCookie() {
    try{
      this._dio.cookieJar = PersistCookieJar();
    }catch(e){
      this._dio.cookieJar = CookieJar();
    }
  }

  Map _addPublicParams(dynamic data) {
    if (data is Map) {
      var params = Map.of(data);
      params.addAll(this._publicParams);
      return params;
    } else {
      return data;
    }
  }
}
