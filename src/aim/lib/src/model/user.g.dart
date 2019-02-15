// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelUser _$ModelUserFromJson(Map<String, dynamic> json) {
  return ModelUser(json['sid'] as String, json['uid'] as String);
}

Map<String, dynamic> _$ModelUserToJson(ModelUser instance) =>
    <String, dynamic>{'sid': instance.sid, 'uid': instance.uid};

ModelUserStock _$ModelUserStockFromJson(Map<String, dynamic> json) {
  return ModelUserStock(
      json['id'] as String,
      json['name'] as String,
      json['order'] as int,
      json['deleted'] as bool,
      json['ctime'] as int,
      json['dtime'] as int);
}

Map<String, dynamic> _$ModelUserStockToJson(ModelUserStock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'deleted': instance.deleted,
      'ctime': instance.ctime,
      'dtime': instance.dtime
    };

ModelUserStocks _$ModelUserStocksFromJson(Map<String, dynamic> json) {
  return ModelUserStocks(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelUserStock.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelUserStocksToJson(ModelUserStocks instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};
