// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelIndex _$ModelIndexFromJson(Map<String, dynamic> json) {
  return ModelIndex(json['id'] as String, json['name'] as String)
    ..quote = json['quote'] == null
        ? null
        : ModelQuote.fromJson(json['quote'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ModelIndexToJson(ModelIndex instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quote': instance.quote
    };

ModelIndexes _$ModelIndexesFromJson(Map<String, dynamic> json) {
  return ModelIndexes(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : ModelIndex.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelIndexesToJson(ModelIndexes instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};

ModelIndexDetail _$ModelIndexDetailFromJson(Map<String, dynamic> json) {
  return ModelIndexDetail(json['id'] as String, json['name'] as String,
      json['url'] as String, json['tidyjs'] as String);
}

Map<String, dynamic> _$ModelIndexDetailToJson(ModelIndexDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'tidyjs': instance.tidyjs
    };
