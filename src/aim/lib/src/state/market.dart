import 'base.dart';
export 'base.dart';
import '../model/index.dart';
import '../model/stock.dart';

class MarketState extends StateBase {
  // main indexes
  List<ModelIndex> indexes;
  // user optional stocks
  List<ModelStock> stocks;

  MarketState({ActionStatus status, this.indexes, this.stocks, String error}): super(status: status, error: error);

  factory MarketState.init() {
    return MarketState(
        status: ActionStatus.todo
    );
  }

  MarketState copyWith({ActionStatus status, List<ModelIndex> indexes, List<ModelStock> stocks, String error}) {
    return MarketState(
        status: status??this.status,
        indexes: indexes??this.indexes,
        stocks: stocks??this.stocks,
        error: error??this.error
    );
  }

  MarketState updateWith({List<ModelIndex> indexes, List<ModelStock> stocks}) {

  }

  List<String> indexCodes() {
    return this.indexes?.map((item){return item.zqdm;})?.toList();
  }

  List<String> stockCodes() {
    return this.stocks?.map((item){return item.zqdm;})?.toList();
  }
}

