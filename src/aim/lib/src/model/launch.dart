import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable()
class LaunchConfig {
  // launch image display duration in seconds
  int duration;
  // remote launch image url
  String imageUrl;
  // local launch image asset key
  String assetKey;

  LaunchConfig({this.duration, this.imageUrl, this.assetKey});

  /// copy with another service configure object
  LaunchConfig copyWith(LaunchConfig cfg) {
    return LaunchConfig(
        duration: cfg?.duration??this.duration,
        imageUrl: cfg?.imageUrl??this.imageUrl,
        assetKey: cfg?.assetKey??this.assetKey
    );
  }

  factory LaunchConfig.fromJson(Map<String, dynamic> json) => _$LaunchConfigFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchConfigToJson(this);
}