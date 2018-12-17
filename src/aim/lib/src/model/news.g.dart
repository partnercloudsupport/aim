// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsCategory _$NewsCategoryFromJson(Map<String, dynamic> json) {
  return NewsCategory(
      json['id'] as int,
      json['code'] as String,
      json['name'] as String,
      json['brief'] as String,
      json['order'] as int,
      json['disabled'] as int,
      json['ctime'] as int,
      json['mtime'] as int);
}

Map<String, dynamic> _$NewsCategoryToJson(NewsCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'brief': instance.brief,
      'order': instance.order,
      'disabled': instance.disabled,
      'ctime': instance.ctime,
      'mtime': instance.mtime
    };

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem(
      json['id'] as int,
      json['code'] as String,
      json['title'] as String,
      json['brief'] as String,
      json['images'] as String,
      json['disabled'] as int,
      json['ptime'] as int,
      json['ctime'] as int,
      json['mtime'] as int);
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'brief': instance.brief,
      'images': instance.images,
      'disabled': instance.disabled,
      'ptime': instance.ptime,
      'ctime': instance.ctime,
      'mtime': instance.mtime
    };

NewsDetail _$NewsDetailFromJson(Map<String, dynamic> json) {
  return NewsDetail(
      json['id'] as int,
      json['code'] as String,
      json['title'] as String,
      json['brief'] as String,
      json['body'] as String,
      json['images'] as String,
      json['disabled'] as int,
      json['ptime'] as int,
      json['ctime'] as int,
      json['mtime'] as int);
}

Map<String, dynamic> _$NewsDetailToJson(NewsDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'brief': instance.brief,
      'body': instance.body,
      'images': instance.images,
      'disabled': instance.disabled,
      'ptime': instance.ptime,
      'ctime': instance.ctime,
      'mtime': instance.mtime
    };
