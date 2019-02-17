// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelNewsCategory _$ModelNewsCategoryFromJson(Map<String, dynamic> json) {
  return ModelNewsCategory(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      brief: json['brief'] as String,
      order: json['order'] as int,
      disabled: json['disabled'] as int,
      ctime: json['ctime'] as int,
      mtime: json['mtime'] as int);
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
      selected: json['selected'] as int,
      items: (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelNewsCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelNewsCategoriesToJson(
        ModelNewsCategories instance) =>
    <String, dynamic>{
      'total': instance.total,
      'selected': instance.selected,
      'items': instance.items
    };

ModelNewsItem _$ModelNewsItemFromJson(Map<String, dynamic> json) {
  return ModelNewsItem(
      id: json['id'] as int,
      code: json['code'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String,
      images: (json['images'] as List)?.map((e) => e as String)?.toList(),
      source: json['source'] as String,
      disabled: json['disabled'] as int,
      ptime: json['ptime'] as int,
      ctime: json['ctime'] as int,
      mtime: json['mtime'] as int)
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
      total: json['total'] as int,
      page: json['page'] as int,
      items: (json['items'] as List)
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
      id: json['id'] as int,
      code: json['code'] as String,
      title: json['title'] as String,
      brief: json['brief'] as String,
      body: json['body'] as String,
      images: json['images'] as String,
      disabled: json['disabled'] as int,
      ptime: json['ptime'] as int,
      ctime: json['ctime'] as int,
      mtime: json['mtime'] as int);
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
