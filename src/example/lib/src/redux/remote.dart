import 'package:dio/dio.dart';

import 'model.dart';

Future<ProtocolStockQuote> fetchQuote<T>() async {
  try{
    var resp = await Dio(Options(method: 'GET', baseUrl: 'http://10.0.0.7:9004')).get('/stock/quote?zqdm=000001');
    var quote = ProtocolStockQuote.fromJson(resp.data);
    return quote;
  } catch(e) {
    rethrow;
  }
}