import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';


@JsonSerializable()
class NewsCategory {
  int id;
  String code;
  String name;
  String brief;
  int order;
  int disabled;
  int ctime;
  int mtime;

  NewsCategory(int id, this.code, this.name, this.brief, this.order, this.disabled, this.ctime, this.mtime);

  factory NewsCategory.fromJson(Map<String, dynamic> json) => _$NewsCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$NewsCategoryToJson(this);
}


@JsonSerializable()
class NewsItem {
  int id;
  String code;
  String title;
  String brief;
  String images;
  int disabled;
  int ptime;
  int ctime;
  int mtime;

  NewsItem(this.id, this.code, this.title, this.brief, this.images, this.disabled, this.ptime, this.ctime, this.mtime);

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}


@JsonSerializable()
class NewsDetail {
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

  NewsDetail(this.id, this.code, this.title, this.brief, this.body, this.images, this.disabled, this.ptime, this.ctime, this.mtime);

  factory NewsDetail.fromJson(Map<String, dynamic> json) => _$NewsDetailFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDetailToJson(this);
}