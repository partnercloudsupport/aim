import 'base.dart';
import '../model/user.dart';
import '../model/stock.dart';

class UserService extends RemoteService {
  static final String SESSION_NAME = '_sid';

  UserService({String baseUrl}): super(baseUrl: baseUrl);

  Future<ModelUser> userLogin(String user, String pwd) async {
    String path = '/user/login';
    var params = {'user': user, 'pwd': pwd};
    var data = await this.post(path, data: params);
    return ModelUser.fromJson(data??{});
  }

  Future<ModelUser> sessionLogin(String sid, String uid) async {
    // add public session id parameters
    if(sid != null)
      this.setPublicParams(SESSION_NAME, sid);
    
    String path = '/session/login';
    var params = {'uid': uid??''};
    var data = await this.post(path, data: params);
    var user = ModelUser.fromJson(data??{});
    
    // update public session id parameters
    if (user?.sid != null){
      this.setPublicParams(SESSION_NAME, user.sid);
    }
    
    return user;
  }

  Future<List<ModelStock>> getUserStocks() async {
    String path = '/user/stock/get';
    var data = await this.get(path);
    return ModelStocks.fromJson(data??{})?.items;

  }
}
