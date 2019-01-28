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
class ImageConfig {
  // app launch image url
  String launch;

  ImageConfig(this.launch);

  factory ImageConfig.fromJson(Map<String, dynamic> json) => _$ImageConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ImageConfigToJson(this);

  /// init service config
  factory ImageConfig.initWith({String launch}) {
    return ImageConfig(launch);
  }

  /// copy with another service configure object
  ImageConfig copyWith(ImageConfig cfg) {
    return ImageConfig.initWith(
        launch: cfg?.launch??this.launch
    );
  }
}


@JsonSerializable()
class AppConfig {
  // image config
  final ImageConfig image;
  // service base url config
  final ServiceConfig service;

  AppConfig(this.image, this.service);

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  /// init app config
  factory AppConfig.initWith({ImageConfig image, ServiceConfig service}) {
    return AppConfig(image, service);
  }

  /// update configure with another configure object
  AppConfig copyWith(AppConfig cfg) {
    return AppConfig.initWith(
      image: this.image?.copyWith(cfg.image)??cfg.image,
      service: this.service?.copyWith(cfg.service)??cfg.service
    );
  }
}
