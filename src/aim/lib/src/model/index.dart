import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';


@JsonSerializable()
class ModelIndexItem {
  String zqdm;
  String name;

  ModelIndexItem(this.zqdm, this.name);

  factory ModelIndexItem.fromJson(Map<String, dynamic> json) => _$ModelIndexItemFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexItemToJson(this);
}


@JsonSerializable()
class ModelMainIndexes {
  int total;
  List<ModelIndexItem> items;

  ModelMainIndexes(this.total, this.items);

  factory ModelMainIndexes.fromJson(Map<String, dynamic> json) => _$ModelMainIndexesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelMainIndexesToJson(this);

  static ModelMainIndexes parse(json) => ModelMainIndexes.fromJson(json);
}


@JsonSerializable()
class ModelIndexQuote {
  String zqdm;
  double jkj; // 今开价
  double zsj; // 昨收价
  double dqj; // 当前价
  double zgj; // 最高价
  double zdj; // 最低价
  double ztj; // 涨停价
  double dtj; // 跌停价
  int cjl; // 成交量，单位：手
  double cje; // 成交额，单位：元
  String time; // 数据时间


  ModelIndexQuote(this.zqdm, this.jkj, this.zsj, this.dqj, this.zgj, this.zdj, this.ztj, this.dtj, this.cjl, this.cje, this.time);

  factory ModelIndexQuote.fromJson(Map<String, dynamic> json) => _$ModelIndexQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexQuoteToJson(this);
}


@JsonSerializable()
class ModelIndexQuotes {
  int total;
  List<ModelIndexQuote> items;

  ModelIndexQuotes(this.total, this.items);

  factory ModelIndexQuotes.fromJson(Map<String, dynamic> json) => _$ModelIndexQuotesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexQuotesToJson(this);

  static ModelIndexQuotes parse(json) => ModelIndexQuotes.fromJson(json);
}
