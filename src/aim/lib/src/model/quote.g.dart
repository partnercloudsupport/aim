// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelQuote _$ModelQuoteFromJson(Map<String, dynamic> json) {
  return ModelQuote(
      json['zqdm'] as String,
      json['source'] as String,
      (json['jkj'] as num)?.toDouble(),
      (json['zsj'] as num)?.toDouble(),
      (json['dqj'] as num)?.toDouble(),
      (json['zgj'] as num)?.toDouble(),
      (json['zdj'] as num)?.toDouble(),
      (json['ztj'] as num)?.toDouble(),
      (json['dtj'] as num)?.toDouble(),
      json['mcl5'] as int,
      (json['mcj5'] as num)?.toDouble(),
      json['mcl4'] as int,
      (json['mcj4'] as num)?.toDouble(),
      json['mcl3'] as int,
      (json['mcj3'] as num)?.toDouble(),
      json['mcl2'] as int,
      (json['mcj2'] as num)?.toDouble(),
      json['mcl1'] as int,
      (json['mcj1'] as num)?.toDouble(),
      json['mrl1'] as int,
      (json['mrj1'] as num)?.toDouble(),
      json['mrl2'] as int,
      (json['mrj2'] as num)?.toDouble(),
      json['mrl3'] as int,
      (json['mrj3'] as num)?.toDouble(),
      json['mrl4'] as int,
      (json['mrj4'] as num)?.toDouble(),
      json['mrl5'] as int,
      (json['mrj5'] as num)?.toDouble(),
      json['cjl'] as int,
      (json['cje'] as num)?.toDouble(),
      json['time'] as String);
}

Map<String, dynamic> _$ModelQuoteToJson(ModelQuote instance) =>
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

ModelQuotes _$ModelQuotesFromJson(Map<String, dynamic> json) {
  return ModelQuotes(
      json['total'] as int,
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : ModelQuote.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelQuotesToJson(ModelQuotes instance) =>
    <String, dynamic>{'total': instance.total, 'items': instance.items};
