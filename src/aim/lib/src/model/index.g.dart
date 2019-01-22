// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelIndex _$ModelIndexFromJson(Map<String, dynamic> json) {
  return ModelIndex(json['zqdm'] as String, json['zqmc'] as String);
}

Map<String, dynamic> _$ModelIndexToJson(ModelIndex instance) =>
    <String, dynamic>{'zqdm': instance.zqdm, 'zqmc': instance.zqmc};

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

ModelIndexQuote _$ModelIndexQuoteFromJson(Map<String, dynamic> json) {
  return ModelIndexQuote(
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
      json['time'] as String);
}

Map<String, dynamic> _$ModelIndexQuoteToJson(ModelIndexQuote instance) =>
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
      'cjl': instance.cjl,
      'cje': instance.cje,
      'time': instance.time
    };

ModelIndexQuotes _$ModelIndexQuotesFromJson(Map<String, dynamic> json) {
  return ModelIndexQuotes(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelIndexQuote.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelIndexQuotesToJson(ModelIndexQuotes instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};
