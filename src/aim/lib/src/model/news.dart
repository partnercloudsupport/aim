import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';


@JsonSerializable()
class NewsCategory {
  String code;
  String name;

  NewsCategory(this.code, this.name);

  factory NewsCategory.fromJson(Map<String, dynamic> json) => _$NewsCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$NewsCategoryToJson(this);
}


@JsonSerializable()
class NewsItem {
  String code;
  String title;

  NewsItem(this.code, this.title);

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}


@JsonSerializable()
class NewsDetail {
  String code;
  String title;
  String body;

  NewsDetail(this.code, this.title, this.body);

  factory NewsDetail.fromJson(Map<String, dynamic> json) => _$NewsDetailFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDetailToJson(this);
}