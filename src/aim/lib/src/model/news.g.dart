// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelNewsCategory _$ModelNewsCategoryFromJson(Map<String, dynamic> json) {
  return ModelNewsCategory(
      json['id'] as int,
      json['code'] as String,
      json['name'] as String,
      json['brief'] as String,
      json['order'] as int,
      json['disabled'] as int,
      json['ctime'] as int,
      json['mtime'] as int);
}

Map<String, dynamic> _$ModelNewsCategoryToJson(ModelNewsCategory instance) =>
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

ModelNewsCategories _$ModelNewsCategoriesFromJson(Map<String, dynamic> json) {
  return ModelNewsCategories(
      total: json['total'] as int,
      items: (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelNewsCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelNewsCategoriesToJson(
        ModelNewsCategories instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};

ModelNewsItem _$ModelNewsItemFromJson(Map<String, dynamic> json) {
  return ModelNewsItem(
      json['id'] as int,
      json['code'] as String,
      json['title'] as String,
      json['brief'] as String,
      (json['images'] as List)?.map((e) => e as String)?.toList(),
      json['source'] as String,
      json['disabled'] as int,
      json['ptime'] as int,
      json['ctime'] as int,
      json['mtime'] as int)
    ..url = json['url'] as String;
}

Map<String, dynamic> _$ModelNewsItemToJson(ModelNewsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'brief': instance.brief,
      'url': instance.url,
      'images': instance.images,
      'source': instance.source,
      'disabled': instance.disabled,
      'ptime': instance.ptime,
      'ctime': instance.ctime,
      'mtime': instance.mtime
    };

ModelNewsItems _$ModelNewsItemsFromJson(Map<String, dynamic> json) {
  return ModelNewsItems(
      json['total'] as int,
      json['page'] as int,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelNewsItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelNewsItemsToJson(ModelNewsItems instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'items': instance.items
    };

ModelNewsDetail _$ModelNewsDetailFromJson(Map<String, dynamic> json) {
  return ModelNewsDetail(
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

Map<String, dynamic> _$ModelNewsDetailToJson(ModelNewsDetail instance) =>
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
