// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelStock _$ModelStockFromJson(Map<String, dynamic> json) {
  return ModelStock(json['zqdm'] as String, json['zqmc'] as String);
}

Map<String, dynamic> _$ModelStockToJson(ModelStock instance) =>
    <String, dynamic>{'zqdm': instance.zqdm, 'zqmc': instance.zqmc};

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

ModelStockQuote _$ModelStockQuoteFromJson(Map<String, dynamic> json) {
  return ModelStockQuote(
      json['zqdm'] as String,
      json['source'] as String,
      (json['jkj'] as num)?.toDouble(),
      (json['zsj'] as num)?.toDouble(),
      (json['dqj'] as num)?.toDouble(),
      (json['zgj'] as num)?.toDouble(),
      (json['zdj'] as num)?.toDouble(),
      (json['ztj'] as num)?.toDouble(),
      (json['dtj'] as num)?.toDouble(),
      json['cjl'] as int,
      (json['cje'] as num)?.toDouble(),
      json['time'] as String)
    ..mcl5 = json['mcl5'] as int
    ..mcj5 = (json['mcj5'] as num)?.toDouble()
    ..mcl4 = json['mcl4'] as int
    ..mcj4 = (json['mcj4'] as num)?.toDouble()
    ..mcl3 = json['mcl3'] as int
    ..mcj3 = (json['mcj3'] as num)?.toDouble()
    ..mcl2 = json['mcl2'] as int
    ..mcj2 = (json['mcj2'] as num)?.toDouble()
    ..mcl1 = json['mcl1'] as int
    ..mcj1 = (json['mcj1'] as num)?.toDouble()
    ..mrl1 = json['mrl1'] as int
    ..mrj1 = (json['mrj1'] as num)?.toDouble()
    ..mrl2 = json['mrl2'] as int
    ..mrj2 = (json['mrj2'] as num)?.toDouble()
    ..mrl3 = json['mrl3'] as int
    ..mrj3 = (json['mrj3'] as num)?.toDouble()
    ..mrl4 = json['mrl4'] as int
    ..mrj4 = (json['mrj4'] as num)?.toDouble()
    ..mrl5 = json['mrl5'] as int
    ..mrj5 = (json['mrj5'] as num)?.toDouble();
}

Map<String, dynamic> _$ModelStockQuoteToJson(ModelStockQuote instance) =>
    <String, dynamic>{
      'zqdm': instance.zqdm,
      'source': instance.source,
      'jkj': instance.jkj,
      'zsj': instance.zsj,
      'dqj': instance.dqj,
      'zgj': instance.zgj,
      'zdj': instance.zdj,
      'ztj': instance.ztj,
      'dtj': instance.dtj,
      'mcl5': instance.mcl5,
      'mcj5': instance.mcj5,
      'mcl4': instance.mcl4,
      'mcj4': instance.mcj4,
      'mcl3': instance.mcl3,
      'mcj3': instance.mcj3,
      'mcl2': instance.mcl2,
      'mcj2': instance.mcj2,
      'mcl1': instance.mcl1,
      'mcj1': instance.mcj1,
      'mrl1': instance.mrl1,
      'mrj1': instance.mrj1,
      'mrl2': instance.mrl2,
      'mrj2': instance.mrj2,
      'mrl3': instance.mrl3,
      'mrj3': instance.mrj3,
      'mrl4': instance.mrl4,
      'mrj4': instance.mrj4,
      'mrl5': instance.mrl5,
      'mrj5': instance.mrj5,
      'cjl': instance.cjl,
      'cje': instance.cje,
      'time': instance.time
    };

ModelStockQuotes _$ModelStockQuotesFromJson(Map<String, dynamic> json) {
  return ModelStockQuotes(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelStockQuote.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelStockQuotesToJson(ModelStockQuotes instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};
