import 'base.dart';
export 'base.dart';

import '../model/stock.dart';

class StockDetailState extends StateBase {
  ModelStock detail;
  StockDetailState({ActionStatus status, this.detail, String error}): super(status: status, error: error);

  factory StockDetailState.init(){
    return StockDetailState(
      status: ActionStatus.todo
    );
  }

  StockDetailState copyWith({ActionStatus status, ModelStock detail, String error}) {
    return StockDetailState(
      status: status??this.status,
      detail: detail??this.detail,
      error: error??this.error
    );
  }

  bool get isForbidden => this.detail?.isForbidden??true;
  String get detailUrl => this.detail?.url??'';
  String get tidyJS => this.detail?.tidyjs;
}
