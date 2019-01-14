import 'model.dart';
import 'state.dart';
import 'action.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    quote: reducerStockQuote(state.quote, action),
  );
}

ProtocolStockQuote reducerStockQuote(ProtocolStockQuote quote, ActionLoadStockQuote action) {
  switch(action.type) {
    case Action.todo:
      return quote;
    case Action.doing:
      return ProtocolStockQuote(1, 'loading', null);
    case Action.done:
      return action.result;
  }
}
