import 'base.dart';
import '../model/user.dart';

class UserService extends RemoteService {
  UserService({String baseUrl}): super(baseUrl: baseUrl);

  Future<ModelSession> buildSession() async {
    String path = '/user/session';
    var data = await this.get(path);
    return ModelSession.fromJson(data);
  }
}
