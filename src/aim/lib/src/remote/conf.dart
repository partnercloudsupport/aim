import 'base.dart';
import '../model/config.dart';


class ConfService extends RemoteService {
  ConfService({String baseUrl}): super(baseUrl: baseUrl);



  Future<AppConfig> getAppConfig() async {
    String path = '/config/app';
    var data = await this.get(path);
    return AppConfig.fromJson(data);
  }
}
