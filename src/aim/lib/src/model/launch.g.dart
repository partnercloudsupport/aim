// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchConfig _$LaunchConfigFromJson(Map<String, dynamic> json) {
  return LaunchConfig(
      duration: json['duration'] as int,
      imageUrl: json['imageUrl'] as String,
      assetKey: json['assetKey'] as String);
}

Map<String, dynamic> _$LaunchConfigToJson(LaunchConfig instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'imageUrl': instance.imageUrl,
      'assetKey': instance.assetKey
    };
