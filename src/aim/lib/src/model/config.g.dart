// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceConfig _$ServiceConfigFromJson(Map<String, dynamic> json) {
  return ServiceConfig(json['conf'] as String, json['user'] as String,
      json['news'] as String, json['smds'] as String);
}

Map<String, dynamic> _$ServiceConfigToJson(ServiceConfig instance) =>
    <String, dynamic>{
      'conf': instance.conf,
      'user': instance.user,
      'news': instance.news,
      'smds': instance.smds
    };

LaunchConfig _$LaunchConfigFromJson(Map<String, dynamic> json) {
  return LaunchConfig(json['duration'] as int, json['imageUrl'] as String,
      json['assetKey'] as String);
}

Map<String, dynamic> _$LaunchConfigToJson(LaunchConfig instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'imageUrl': instance.imageUrl,
      'assetKey': instance.assetKey
    };

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig(
      json['launch'] == null
          ? null
          : LaunchConfig.fromJson(json['launch'] as Map<String, dynamic>),
      json['service'] == null
          ? null
          : ServiceConfig.fromJson(json['service'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) =>
    <String, dynamic>{'launch': instance.launch, 'service': instance.service};
