import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';


@JsonSerializable()
class ModelNewsCategory {
  int id;
  String code;
  String name;
  String brief;
  int order;
  int disabled;
  int ctime;
  int mtime;

  ModelNewsCategory(int id, this.code, this.name, this.brief, this.order, this.disabled, this.ctime, this.mtime);

  factory ModelNewsCategory.fromJson(Map<String, dynamic> json) => _$ModelNewsCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ModelNewsCategoryToJson(this);
}


@JsonSerializable()
class ModelNewsItem {
  int id;
  String code;
  String title;
  String brief;
  List<String> images;
  String source;
  int disabled;
  int ptime;
  int ctime;
  int mtime;

  ModelNewsItem(this.id, this.code, this.title, this.brief, this.images, this.source, this.disabled, this.ptime, this.ctime, this.mtime);

  factory ModelNewsItem.fromJson(Map<String, dynamic> json) => _$ModelNewsItemFromJson(json);
  Map<String, dynamic> toJson() => _$ModelNewsItemToJson(this);
}


@JsonSerializable()
class ModelNewsDetail {
  int id;
  String code;
  String title;
  String brief;
  String body;
  String images;
  int disabled;
  int ptime;
  int ctime;
  int mtime;

  ModelNewsDetail(this.id, this.code, this.title, this.brief, this.body, this.images, this.disabled, this.ptime, this.ctime, this.mtime);

  factory ModelNewsDetail.fromJson(Map<String, dynamic> json) => _$ModelNewsDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ModelNewsDetailToJson(this);
}