import '../../model/index.dart';
import 'base.dart';

export 'base.dart';


class IndexesState{
  MainIndexesState mainIndexesState;

  IndexesState({this.mainIndexesState});
  IndexesState.init() {
    mainIndexesState = MainIndexesState.init();
  }
}

class MainIndexesState extends BaseState{
  ModelIndexes indexes;

  MainIndexesState({Status status, String msg, this.indexes}): super(status: status, msg: msg);
  MainIndexesState.init();

  List<String> indexCodes() {
    if(indexes != null) {
      return indexes.indexCodes();
    }
    return null;
  }

  void update(ModelIndexes quotes) {
    if(quotes == null || indexes == null){
      return;
    }

    indexes.update(quotes);
  }
}
