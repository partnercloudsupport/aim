
enum Action {todo, doing, done}

class ActionLoadStockQuote {
  Action type;
  dynamic result;

  ActionLoadStockQuote({this.type, this.result});
}
