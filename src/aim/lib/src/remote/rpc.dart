import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../models.dart' as models;

import 'config.dart';


typedef Parser(obj);

class Rpc {
  final Dio _dio;

  final String method;
  final String baseurl;
  final String path;

  final Parser parser;

  Rpc({@required this.method, @required this.baseurl, @required this.path, this.parser}):_dio = Dio(
    Options(
      method: method,
      baseUrl: baseurl
    )
  );

  Rpc.get({this.baseurl, this.path, this.parser}):method='GET', _dio = Dio(
    Options(
      method: 'GET',
      baseUrl: baseurl
    )
  );

  Rpc.post({this.baseurl, this.path, this.parser}):method='POST', _dio = Dio(
      Options(
          method: 'POST',
          baseUrl: baseurl
      )
  );

  Future<T> request<T>({data}) async {
    try{
      var resp = await _dio.request(this.path, options:_dio.options, data: data);
      var result = models.Protocol.fromJson(resp.data);
      if (result.status != 0){
        throw result.msg;
      }
      return parser==null ? null : parser(result.data);
    } catch(e) {
      rethrow;
    }
  }
}


class AlmRpc extends Rpc {
  AlmRpc(String method, String path, [Parser parser]): super(method: method, baseurl: Service.ALM, path:path, parser:parser);

  AlmRpc.get({String path, Parser parser}):super(method:'GET', baseurl:Service.ALM, path:path, parser:parser);
  AlmRpc.post({String path, Parser parser}):super(method:'POST', baseurl:Service.ALM, path:path, parser:parser);
}