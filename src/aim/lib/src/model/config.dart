import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class ServiceConfig {
  // configure service base url
  String conf;
  // user service base url
  String user;
  // news service base url
  String news;
  // securities market data service base url
  String smds;

  ServiceConfig(this.conf, this.user, this.news, this.smds);

  factory ServiceConfig.fromJson(Map<String, dynamic> json) => _$ServiceConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceConfigToJson(this);

  /// init service config
  factory ServiceConfig.initWith({String conf, String user, String news, String smds}) {
    return ServiceConfig(conf, user, news, smds);
  }

  /// copy with another service configure object
  ServiceConfig copyWith(ServiceConfig cfg) {
    return ServiceConfig.initWith(
      conf: cfg?.conf??this.conf,
      user: cfg?.user??this.user,
      news: cfg?.news??this.news,
      smds: cfg?.smds??this.smds
    );
  }
}

@JsonSerializable()
class LaunchConfig {
  // launch image display duration in seconds
  int duration;
  // remote launch image url
  String imageUrl;
  // local launch image asset key
  String assetKey;

  LaunchConfig(this.duration, this.imageUrl, this.assetKey);

  /// init service config
  factory LaunchConfig.initWith({int duration, String imageUrl, String assetKey}) {
    return LaunchConfig(duration, imageUrl, assetKey);
  }

  /// copy with another service configure object
  LaunchConfig copyWith(LaunchConfig cfg) {
    return LaunchConfig.initWith(
      duration: cfg?.duration??this.duration,
      imageUrl: cfg?.imageUrl??this.imageUrl,
      assetKey: cfg?.assetKey??this.assetKey
    );
  }

  factory LaunchConfig.fromJson(Map<String, dynamic> json) => _$LaunchConfigFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchConfigToJson(this);
}

@JsonSerializable()
class AppConfig {
  // launch configure
  final LaunchConfig launch;
  // service base url config
  final ServiceConfig service;

  AppConfig(this.launch, this.service);

  /// init app config
  factory AppConfig.initWith({LaunchConfig launch, ServiceConfig service}) {
    return AppConfig(launch, service);
  }

  /// update configure with another configure object
  AppConfig copyWith(AppConfig cfg) {
    return AppConfig.initWith(
      launch: this.launch?.copyWith(cfg?.launch)??cfg.launch,
      service: this.service?.copyWith(cfg?.service)??cfg.service
    );
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
