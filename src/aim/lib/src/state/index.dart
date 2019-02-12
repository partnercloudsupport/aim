import 'base.dart';
export 'base.dart';
import '../model/index.dart';
import '../model/quote.dart';

class IndexState extends StateBase {
  // main indexes
  List<ModelIndex> indexes;

  IndexState({ActionStatus status, this.indexes, String error}): super(status: status, error: error);

  factory IndexState.init() {
    return IndexState(
        status: ActionStatus.todo
    );
  }

  IndexState copyWith({ActionStatus status, List<ModelIndex> indexes, String error}) {
    return IndexState(
        status: status??this.status,
        indexes: indexes??this.indexes,
        error: error??this.error
    );
  }

  IndexState updateWith({List<ModelQuote> quotes}) {

  }

  List<String> indexCodes() {
    return this.indexes?.map((item){return item.zqdm;})?.toList();
  }
}

