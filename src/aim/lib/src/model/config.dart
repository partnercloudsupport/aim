import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class AppConfig {
  // service base url config
  final ServiceConfig service;

  AppConfig({this.service});

  /// update configure with another configure object
  AppConfig copyWith(AppConfig cfg) {
    return AppConfig(
        service: this.service?.copyWith(cfg?.service)??cfg.service
    );
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}

@JsonSerializable()
class ServiceConfig {
  // app service base url
  String app;
  // user service base url
  String user;
  // news service base url
  String news;
  // securities market data service base url
  String smds;

  ServiceConfig({this.app, this.user, this.news, this.smds});

  factory ServiceConfig.fromJson(Map<String, dynamic> json) => _$ServiceConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceConfigToJson(this);

  /// copy with another service configure object
  ServiceConfig copyWith(ServiceConfig cfg) {
    return ServiceConfig(
      app: cfg?.app??this.app,
      user: cfg?.user??this.user,
      news: cfg?.news??this.news,
      smds: cfg?.smds??this.smds
    );
  }
}
