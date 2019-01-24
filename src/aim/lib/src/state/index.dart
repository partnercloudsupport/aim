import 'base.dart';
export 'base.dart';

import '../model/index.dart';


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

  StateMainIndexes({this.state, this.indexes});

  factory StateMainIndexes.init() => StateMainIndexes(
    state: LState.init(),
    indexes: []
  );

  factory StateMainIndexes.loading() => StateMainIndexes(state: LState.loading());
  factory StateMainIndexes.failed(String msg) => StateMainIndexes(state: LState.failed(msg));

  StateMainIndexes copyWith({LState state, List<ModelIndex> indexes}) {
    return StateMainIndexes(
      state: state??this.state,
      indexes: indexes??this.indexes,
    );
  }

  StateMainIndexes updateWith({List<ModelIndex> quotes}) {
    var others = Map.fromIterable(quotes, key: (item){return item.zqdm;});
    var indexes = this.indexes?.map((item){
      if(others.containsKey(item.zqdm))
        return item.updateWith(others[item.zqdm]);
      else
        return item;
    })?.toList();

    return StateMainIndexes(
      state: this.state,
      indexes: indexes??this.indexes,
    );
  }

  List<String> get codes => this.indexes?.map((item){ return item?.zqdm;})?.toList();
}
