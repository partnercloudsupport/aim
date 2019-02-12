// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelStock _$ModelStockFromJson(Map<String, dynamic> json) {
  return ModelStock(
      json['id'] as String,
      json['name'] as String,
      json['jianpin'] as String,
      json['quanpin'] as String,
      json['status'] as String,
      json['limit'] as String,
      json['ctime'] as int,
      json['mtime'] as int,
      json['url'] as String,
      json['tidyjs'] as String,
      json['quote'] == null
          ? null
          : ModelQuote.fromJson(json['quote'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ModelStockToJson(ModelStock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jianpin': instance.jianpin,
      'quanpin': instance.quanpin,
      'status': instance.status,
      'limit': instance.limit,
      'ctime': instance.ctime,
      'mtime': instance.mtime,
      'url': instance.url,
      'tidyjs': instance.tidyjs,
      'quote': instance.quote
    };

ModelStocks _$ModelStocksFromJson(Map<String, dynamic> json) {
  return ModelStocks(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : ModelStock.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelStocksToJson(ModelStocks instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};
