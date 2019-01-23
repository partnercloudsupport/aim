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
  LState state;
  List<ModelIndex> indexes;
  List<ModelIndexQuote> quotes;

  StateMainIndexes({this.state, this.indexes, this.quotes});

  factory StateMainIndexes.init() => StateMainIndexes(
    state: LState.init(),
    indexes: [],
    quotes: [],
  );

  factory StateMainIndexes.loading() => StateMainIndexes(state: LState.loading());
  factory StateMainIndexes.failed(String msg) => StateMainIndexes(state: LState.failed(msg));

  StateMainIndexes copyWith({LState state, List<ModelIndex> indexes, List<ModelIndexQuote> quotes}) {
    return StateMainIndexes(
      state: state??this.state,
      indexes: indexes??this.indexes,
      quotes: quotes??this.quotes
    );
  }

  StateMainIndexes updateWith({List<ModelIndexQuote> quotes}) {
    return StateMainIndexes(
      state: this.state,
      indexes: this.indexes,
      quotes: quotes??this.quotes
    );
  }

  List<String> get codes => this.indexes?.map((item){ return item?.zqdm;})?.toList();

  ModelIndex getIndex(int i) => this.indexes?.length>i ? this.indexes[i] : null;
  ModelIndexQuote getQuote(String zqdm) => quotes?.firstWhere((quote){return quote.zqdm == zqdm;}, orElse: (){return null;});
}
