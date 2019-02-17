import 'base.dart';
import '../../state/all.dart';
import '../../model/stock.dart';
import '../../model/index.dart';

class MarketViewModel extends ViewState {
  final List<ModelIndex> mainIndexes;
  final List<ModelStock> userStocks;

  MarketViewModel({this.mainIndexes, this.userStocks, ViewStatus status, String tip}): super(status: status, tip: tip);

  static MarketViewModel fromAppState(AppState state) {
    return MarketViewModel(
      mainIndexes: state.marketIndexes?.take(3),
      userStocks: state.marketStocks?.selectByIds(state.userStocks?.stocks),
      status: joinStatus([state.marketIndexes.status, state.marketStocks.status, state.userStocks.status]),
      tip: joinTips([state.marketStocks.tip, state.marketStocks.tip, state.userStocks.tip])
    );
  }
}
