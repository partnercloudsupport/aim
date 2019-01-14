// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockQuote _$StockQuoteFromJson(Map<String, dynamic> json) {
  return StockQuote(json['zqdm'] as String, (json['dqj'] as num)?.toDouble(),
      (json['zsj'] as num)?.toDouble(), (json['jkj'] as num)?.toDouble());
}

Map<String, dynamic> _$StockQuoteToJson(StockQuote instance) =>
    <String, dynamic>{
      'zqdm': instance.zqdm,
      'dqj': instance.dqj,
      'zsj': instance.zsj,
      'jkj': instance.jkj
    };

ProtocolStockQuote _$ProtocolStockQuoteFromJson(Map<String, dynamic> json) {
  return ProtocolStockQuote(
      json['status'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : StockQuote.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ProtocolStockQuoteToJson(ProtocolStockQuote instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data
    };
