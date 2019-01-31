import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ModelUser {
  // session id
  final String sid;
  // user id
  final String uid;

  ModelUser(this.sid, this.uid);

  factory ModelUser.fromJson(Map<String, dynamic> json) => _$ModelUserFromJson(json);
  Map<String, dynamic> toJson() => _$ModelUserToJson(this);
}

@JsonSerializable()
class ModelUserStock {
  String zqdm; //证券代码
  String zqmc; //证券名称
  int order; //排序值，大->小
  bool deleted; //删除标识
  int ctime; // 创建时间
  int dtime; // 删除时间

  ModelUserStock(this.zqdm, this.zqmc, this.order, this.deleted, this.ctime, this.dtime);
  factory ModelUserStock.initWith({String zqdm, String zqmc, int order, bool deleted, int ctime, int dtime}){
    return ModelUserStock(zqdm, zqmc, order, deleted, ctime, dtime);
  }

  factory ModelUserStock.fromJson(Map<String, dynamic> json) => _$ModelUserStockFromJson(json);
  Map<String, dynamic> toJson() => _$ModelUserStockToJson(this);
}

@JsonSerializable()
class ModelUserStocks {
  int total;
  List<ModelUserStock> items;

  ModelUserStocks(this.total, this.items);

  factory ModelUserStocks.fromJson(Map<String, dynamic> json) => _$ModelUserStocksFromJson(json);
  Map<String, dynamic> toJson() => _$ModelUserStocksToJson(this);
}
