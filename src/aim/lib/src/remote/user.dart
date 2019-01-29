import 'base.dart';
import '../model/user.dart';
import '../model/stock.dart';

class UserService extends RemoteService {
  UserService({String baseUrl}): super(baseUrl: baseUrl);

  Future<ModelUser> login(String user, String pwd) async {
    String path = '/user/login';
    var params = {'user': user, 'pwd': pwd};
    var data = await this.post(path, data: params);
    return ModelUser.fromJson(data??{});
  }

  Future<List<ModelStock>> getUserStocks() async {
    String path = '/user/stock/get';
    var data = await this.get(path);
    return ModelStocks.fromJson(data??{})?.items;

  }
}
