import 'base.dart';
import '../model/config.dart';
import '../model/launch.dart';


class AppService extends RemoteService {
  AppService({String baseUrl}): super(baseUrl: baseUrl);

  Future<AppConfig> getAppConfig() async {
    String path = '/app/config';
    var data = await this.get(path);
    return AppConfig.fromJson(data);
  }

  Future<LaunchConfig> getLaunchConfig() async {
    String path = '/app/launch';
    var data = await this.get(path);
    return LaunchConfig.fromJson(data);
  }
}
