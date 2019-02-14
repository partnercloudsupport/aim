import 'package:json_annotation/json_annotation.dart';
import 'quote.dart';

part 'index.g.dart';

@JsonSerializable()
class ModelIndex {
  String id; // 证券代码
  String name; // 证券名称

  ModelQuote quote; // 指数行情

  ModelIndex(this.id, this.name);

  String get zqdm => id ?? '--';
  String get zqmc => name ?? '--';

  factory ModelIndex.fromJson(Map<String, dynamic> json) => _$ModelIndexFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexToJson(this);
}

@JsonSerializable()
class ModelIndexes {
  int total;
  List<ModelIndex> items;

  ModelIndexes(this.total, this.items);

  factory ModelIndexes.fromJson(Map<String, dynamic> json) => _$ModelIndexesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexesToJson(this);
}


@JsonSerializable()
class ModelIndexDetail {
  String id; // 证券代码
  String name; // 证券名称
  String url; // 详情页url
  String tidyjs; // 详情页清理js url

  ModelIndexDetail(this.id, this.name, this.url, this.tidyjs);

  String get zqdm => id ?? '--';
  String get zqmc => name ?? '--';

  factory ModelIndexDetail.fromJson(Map<String, dynamic> json) => _$ModelIndexDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexDetailToJson(this);
}
