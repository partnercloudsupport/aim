import 'package:redux/redux.dart';

import 'state.dart';
import 'action.dart';
import 'remote.dart';

final List<Middleware<AppState>> appMiddleware = [
  TypedMiddleware<AppState, ActionLoadStockQuote>(loadStockQuote)
];

void loadStockQuote(Store<AppState> store, ActionLoadStockQuote action, NextDispatcher dispatcher) async {
  dispatcher(action);
  if (action.type == Action.todo){
    try {
      var result = await fetchQuote();
      store.dispatch(ActionLoadStockQuote(type:Action.done, result:result));
    } catch (e) {
      store.dispatch(ActionLoadStockQuote(type:Action.done, result:e.toString()));
    }
  }
}