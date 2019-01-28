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

ImageConfig _$ImageConfigFromJson(Map<String, dynamic> json) {
  return ImageConfig(json['launch'] as String);
}

Map<String, dynamic> _$ImageConfigToJson(ImageConfig instance) =>
    <String, dynamic>{'launch': instance.launch};

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig(
      json['image'] == null
          ? null
          : ImageConfig.fromJson(json['image'] as Map<String, dynamic>),
      json['service'] == null
          ? null
          : ServiceConfig.fromJson(json['service'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) =>
    <String, dynamic>{'image': instance.image, 'service': instance.service};
