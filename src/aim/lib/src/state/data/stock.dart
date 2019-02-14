import 'base.dart';
export 'base.dart';
import '../../model/index.dart';
import '../../model/stock.dart';
import '../../model/quote.dart';

// market data
class Market {
  // market stock data
  MarketStocks stocks;
  // market index data
  MarketIndexes indexes;

  Market({this.stocks, this.indexes});

  factory Market.init() {
    return Market(
      stocks: MarketStocks.init(),
      indexes: MarketIndexes.init(),
    );
  }
}

// market stock data
class MarketStocks extends DataState{
  // market indexes
  Map<String, ModelStock> stocks;

  MarketStocks({this.stocks});

  factory MarketStocks.init() {
    return MarketStocks(
        stocks: {}
    );
  }

  void addStock(ModelStock stock) {
    ModelStock old = this.stocks[stock.id];
    if(old != null && stock.quote == null){
      stock.quote = old.quote;
    }
    this.stocks[stock.id] = stock;
  }

  void updateQuote(ModelQuote quote) {
    this.stocks[quote.zqdm]?.quote = quote;
  }

  void updateQuotes(List<ModelQuote> quotes) {
    quotes.forEach((quote){this.updateQuote(quote);});
  }
}

// market indexes
class MarketIndexes extends DataState {
  // market indexes
  Map<String, ModelIndex> indexes;

  MarketIndexes({this.indexes});

  factory MarketIndexes.init() {
    return MarketIndexes(
        indexes: {}
    );
  }

  List<ModelIndex> take(int count) {
    return this.indexes.values.take(3).toList();
  }

  void addIndex(ModelIndex index) {
    ModelIndex old = this.indexes[index.id];
    if(old != null && index.quote == null){
      index.quote = old.quote;
    }
    this.indexes[index.id] = index;
  }

  void updateQuote(ModelQuote quote) {
    this.indexes[quote.zqdm]?.quote = quote;
  }

  void updateQuotes(List<ModelQuote> quotes) {
    quotes.forEach((quote){this.updateQuote(quote);});
  }
}
