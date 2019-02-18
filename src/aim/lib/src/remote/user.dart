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

  // 获取用户自选股票
  Future<List<ModelUserStock>> getUserStocks() async {
    String path = '/user/stock/get';
    var data = await this.get(path);
    return ModelUserStocks.fromJson(data??{})?.items;
  }

  // 添加用户自选股票
  Future<void> addUserStock(String id) async {
    String path = '/user/stock/add';
    var params = {'id': id??''};
    var data = await this.post(path, data: params);
  }

  // 删除用户自选股票
  Future<void> delUserStock(String id) async {
    String path = '/user/stock/del';
    var params = {'id': id??''};
    var data = await this.post(path, data: params);
  }
}
