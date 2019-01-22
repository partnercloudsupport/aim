import '../../model/index.dart';
import 'base.dart';

export 'base.dart';


class StateIndexes{
  StateMainIndexes mainIndexes;

  StateIndexes({this.mainIndexes});

  factory StateIndexes.init() => StateIndexes(
    mainIndexes: StateMainIndexes.init()
  );
}


class StateMainIndexes {
  State state;
  List<StateMainIndex> indexes;

  StateMainIndexes({this.state, this.indexes});

  factory StateMainIndexes.init() => StateMainIndexes(
    state: State.init(),
    indexes: []
  );

  factory StateMainIndexes.loading() => StateMainIndexes(state: State.loading());
  factory StateMainIndexes.failed(String msg) => StateMainIndexes(state: State.failed(msg));

  StateMainIndexes copyWith({State state, List<StateMainIndex> indexes}) {
    return StateMainIndexes(
      state: state??this.state,
      indexes: indexes??this.indexes
    );
  }

  StateMainIndexes updateWith({List<ModelIndexQuote> quotes}) {
    Map<String, ModelIndexQuote> indexQuotes = Map.fromIterable(quotes??[], key: (item){return item.zqdm;});

    List<StateMainIndex> newIndexes = [];
    for (var item in this.indexes) {
      newIndexes.add(StateMainIndex(index: item.index, quote: indexQuotes.containsKey(item.code) ? indexQuotes[item.code] : item.quote));
    }

    return StateMainIndexes(state: this.state,  indexes: newIndexes);
  }

  List<String> get codes => this.indexes?.map((item){ return item?.code;})?.toList();

  StateMainIndex get(int i) => this.indexes.length>i ? this.indexes[i] : null;
}

class StateMainIndex {
  ModelIndex index;
  ModelIndexQuote quote;

  StateMainIndex({this.index, this.quote});

  String get code => this.index?.zqdm;
  String get name => this.index?.zqmc;

  void update(ModelIndexQuote quote) {
    this.quote = quote;
  }
}