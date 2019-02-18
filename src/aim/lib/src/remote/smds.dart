import 'base.dart';
import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';

class SmdsService extends RemoteService {
  SmdsService({String baseUrl}) : super(baseUrl: baseUrl);

  ///////////////////// index ////////////////////
  // 获取所有指数列表
  Future<List<ModelIndex>> getAllIndexes() async {
    String path = '/index/list';
    var data = await this.get(path);
    return ModelIndexes.fromJson(data??'{}')?.items;
  }

  // 获取单个指数详情
  Future<ModelIndexDetail> getIndexDetail(String id) async {
    String path = '/index/detail';
    var params = {'id': id};
    var data = await this.get(path, data: params);
    return ModelIndexDetail.fromJson(data??'{}');
  }

  // 获取单个指数行情
  Future<ModelQuote> getIndexQuote(String id) async {
    String path = '/index/quote';
    var params = {'id': id};
    var data = await this.get(path, data: params);
    return ModelQuotes.fromJson(data??'{}')?.items?.first;
  }

  // 获取多个指数行情
  Future<List<ModelQuote>> getIndexesQuote(List<String> ids) async {
    String path = '/index/quote';
    var params = {'id': ids.join(',')};
    var data = await this.get(path, data: params);
    return ModelQuotes.fromJson(data??'{}')?.items;
  }

  ///////////////////// stock ////////////////////
  // 获取所有股票列表
  Future<List<ModelStock>> getAllStocks() async {
    String path = '/stock/list';
    var data = await this.get(path);
    return ModelStocks.fromJson(data??'{}')?.items;
  }

  // 获取热门股票列表
  Future<List<ModelStock>> getHottestStocks() async {
    String path = '/stock/hottest';
    var data = await this.get(path);
    return ModelStocks.fromJson(data??'{}')?.items;
  }

  // 获取单个股票详情
  Future<ModelStockDetail> getStockDetail(String id) async {
    String path = '/stock/detail';
    var params = {'id': id};
    var data = await this.get(path, data: params);
    return ModelStockDetail.fromJson(data??'{}');
  }

  // 获取单个股票行情
  Future<ModelQuote> getStockQuote(String id) async {
    String path = '/stock/quote';
    var params = {'id': id};
    var data = await this.get(path, data: params);
    return ModelQuotes.fromJson(data??'{}')?.items?.first;
  }

  // 获取多个股票行情
  Future<List<ModelQuote>> getStocksQuote(List<String> ids) async {
    String path = '/stock/quote';
    var params = {'id': ids.join(',')};
    var data = await this.get(path, data: params);
    return ModelQuotes.fromJson(data??'{}')?.items;
  }
}
