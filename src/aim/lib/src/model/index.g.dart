// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelIndexItem _$ModelIndexItemFromJson(Map<String, dynamic> json) {
  return ModelIndexItem(json['zqdm'] as String, json['name'] as String);
}

Map<String, dynamic> _$ModelIndexItemToJson(ModelIndexItem instance) =>
    <String, dynamic>{'zqdm': instance.zqdm, 'name': instance.name};

ModelMainIndexes _$ModelMainIndexesFromJson(Map<String, dynamic> json) {
  return ModelMainIndexes(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ModelIndexItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelMainIndexesToJson(ModelMainIndexes instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};

ModelIndexQuote _$ModelIndexQuoteFromJson(Map<String, dynamic> json) {
  return ModelIndexQuote(
      json['zqdm'] as String,
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
