import 'package:dio/dio.dart';

import '../models.dart' as models;


class Rpc {
  Dio _dio;

  Rpc(this._dio);

  Future<T> get<T>(path) async {
    try {
      var resp = await _dio.get(path);
      models.Protocol protocol = models.Protocol.fromJson(resp.data);
      if (protocol.status != 0) {
        throw protocol.msg;
      }

      return protocol.data;
    } catch(e) {
      rethrow;
    }
  }
}

// remote aim service
Rpc aim = Rpc(Dio(
    Options(
      baseUrl: 'http://localhost:9002',
      connectTimeout: 5000,
      receiveTimeout: 10000,
    )
));


