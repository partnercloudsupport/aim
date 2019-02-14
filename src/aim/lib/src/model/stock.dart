import 'package:json_annotation/json_annotation.dart';
import 'quote.dart';

part 'stock.g.dart';


@JsonSerializable()
class ModelStock {
  String id; // 证券代码
  String name; // 证券名称
  String jianpin; // 名称简拼
  String quanpin; // 名称全拼

  ModelQuote quote; // 股票行情

  ModelStock(this.id, this.name, this.jianpin, this.quanpin);

  factory ModelStock.initWith({String id, String name, String jianpin, String quanpin}) {
    return ModelStock(id, name, jianpin, quanpin);
  }

  String get zqdm => id ?? '--';
  String get zqmc => name ?? '--';

  factory ModelStock.fromJson(Map<String, dynamic> json) => _$ModelStockFromJson(json);
  Map<String, dynamic> toJson() => _$ModelStockToJson(this);
}

@JsonSerializable()
class ModelStocks {
  int total;
  List<ModelStock> items;

  ModelStocks(this.total, this.items);

  factory ModelStocks.fromJson(Map<String, dynamic> json) => _$ModelStocksFromJson(json);
  Map<String, dynamic> toJson() => _$ModelStocksToJson(this);
}


@JsonSerializable()
class ModelStockDetail {
  String id; // 证券代码
  String name; // 证券名称
  String jianpin; // 名称简拼
  String quanpin; // 名称全拼

  String status; // 证券状态, open-正常, close-停牌, delisted-退市
  String limit; // 交易限制, none-无限制, nobuy-禁买, nodelay-禁止延期
  int ctime; // 创建时间
  int mtime; // 修改时间

  String url; // 详情页url
  String tidyjs; // 详情页清理js url

  ModelStockDetail(this.id, this.name, this.jianpin, this.quanpin, this.status, this.limit, this.ctime, this.mtime, this.url, this.tidyjs);

  factory ModelStockDetail.initWith({String id, String name, String jianpin, String quanpin, String status, String limit, int ctime, int mtime, String url, String tidyjs}) {
    return ModelStockDetail(id, name, jianpin, quanpin, status, limit, ctime, mtime, url, tidyjs);
  }

  String get zqdm => id ?? '--';
  String get zqmc => name ?? '--';

  bool get isOpen => this.status == 'open';
  bool get isClosed => this.status == 'closed';
  bool get isDelisted => this.status == 'delisted';

  bool get isNoLimit => this.limit == 'none';
  bool get isNoBuy => this.limit == 'nobuy';
  bool get isNoDelay => this.limit == 'nodelay';

  bool get isBuyDisabled => this.limit!='none' || this.status!='open';
  bool get isSellDisabled => this.status == 'open';

  factory ModelStockDetail.fromJson(Map<String, dynamic> json) => _$ModelStockDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ModelStockDetailToJson(this);
}
