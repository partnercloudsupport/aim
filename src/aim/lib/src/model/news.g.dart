// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsCategory _$NewsCategoryFromJson(Map<String, dynamic> json) {
  return NewsCategory(json['code'] as String, json['name'] as String);
}

Map<String, dynamic> _$NewsCategoryToJson(NewsCategory instance) =>
    <String, dynamic>{'code': instance.code, 'name': instance.name};

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem(json['code'] as String, json['title'] as String);
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) =>
    <String, dynamic>{'code': instance.code, 'title': instance.title};

NewsDetail _$NewsDetailFromJson(Map<String, dynamic> json) {
  return NewsDetail(
      json['code'] as String, json['title'] as String, json['body'] as String);
}

Map<String, dynamic> _$NewsDetailToJson(NewsDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'body': instance.body
    };
