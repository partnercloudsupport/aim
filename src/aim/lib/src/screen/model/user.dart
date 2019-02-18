import 'base.dart';
import '../../state/all.dart';
import '../../model/stock.dart';

class UserStocksViewModel extends ViewState {
  final List<ModelStock> stocks;

  UserStocksViewModel({this.stocks, ViewStatus status, String tip}): super(status: status, tip: tip);

  static UserStocksViewModel fromAppState(AppState state) {
    return UserStocksViewModel(
        stocks: state.market?.stocks?.selectByIds(state.user?.stocks?.stocks),
        status: convertStatus(state.user?.stocks?.status),
        tip: state.user?.stocks?.tip
    );
  }
}
