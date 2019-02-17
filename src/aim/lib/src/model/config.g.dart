// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig(
      service: json['service'] == null
          ? null
          : ServiceConfig.fromJson(json['service'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) =>
    <String, dynamic>{'service': instance.service};

ServiceConfig _$ServiceConfigFromJson(Map<String, dynamic> json) {
  return ServiceConfig(
      app: json['app'] as String,
      user: json['user'] as String,
      news: json['news'] as String,
      smds: json['smds'] as String);
}

Map<String, dynamic> _$ServiceConfigToJson(ServiceConfig instance) =>
    <String, dynamic>{
      'app': instance.app,
      'user': instance.user,
      'news': instance.news,
      'smds': instance.smds
    };
