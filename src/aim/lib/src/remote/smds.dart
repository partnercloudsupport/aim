import 'base.dart';
import '../model/index.dart';
import '../model/stock.dart';

class SmdsService extends RemoteService {
  SmdsService({String baseUrl}) : super(baseUrl: baseUrl);

  // 获取主要指数列表
  Future<List<ModelIndex>> getMainIndexes() async {
    String path = '/index/main';
    var data = await this.get(path);
    return ModelIndexes.fromJson(data??'{}')?.items;
  }

  // 获取指数行情
  Future<List<ModelIndex>> getIndexQuotes(List<String> indexCodes) async {
    String path = '/index/quote';
    var params = {'zqdm': indexCodes.join(',')};
    var data = await this.get(path, data: params);
    return ModelIndexes.fromJson(data??'{}')?.items;
  }

  // 获取股票详情
  Future<ModelStock> getStockDetail(String stockCode) async {
    String path = '/stock/detail';
    var params = {'zqdm': stockCode};
    var data = await this.get(path, data: params);
    return ModelStock.fromJson(data??'{}');
  }
  
  // 获取股票行情
  Future<List<ModelStock>> getStockQuotes(List<String> stockCodes) async {
    String path = '/stock/quote';
    var params = {'zqdm': stockCodes.join(',')};
    var data = await this.get(path, data: params);
    return ModelStocks.fromJson(data??'{}')?.items;
  }
}
