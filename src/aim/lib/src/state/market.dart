import 'base.dart';
export 'base.dart';
import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';

// market data
class Market {
  // market stock data
  MarketStocks stocks;
  // market index data
  MarketIndexes indexes;

  // current market stock detail
  MarketStockDetail stock;
  // current market index detail
  MarketIndexDetail index;

  Market({this.stocks, this.indexes, this.stock, this.index});

  factory Market.init() {
    return Market(
      stocks: MarketStocks.init(),
      indexes: MarketIndexes.init(),
      stock: MarketStockDetail.init(),
      index: MarketIndexDetail.init()
    );
  }
}

// market stock data
class MarketStocks extends DataState{
  // market indexes
  Map<String, ModelStock> stocks;

  MarketStocks({this.stocks, DataStatus status, String tip}): super(status: status, tip: tip);

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

// market stock detail data
class MarketStockDetail extends DataState {
  // market stock detail
  ModelStockDetail stock;
  MarketStockDetail({this.stock, DataStatus status, String tip}): super(status: status, tip: tip);
  factory MarketStockDetail.init() {
    return MarketStockDetail();
  }
}

// market indexes
class MarketIndexes extends DataState {
  // market indexes
  Map<String, ModelIndex> indexes;

  MarketIndexes({this.indexes, DataStatus status, String tip}): super(status: status, tip: tip);

  factory MarketIndexes.init() {
    return MarketIndexes(
      indexes: {}
    );
  }

  MarketIndexes copyWith({Map<String, ModelIndex> indexes, DataStatus status, String tip}) {
    return MarketIndexes(
      indexes: indexes??this.indexes,
      status: status??this.status,
      tip: status??this.tip
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

// market index detail data
class MarketIndexDetail extends DataState {
  // market index detail
  ModelIndexDetail index;
  MarketIndexDetail({this.index, DataStatus status, String tip}): super(status: status, tip: tip);
  factory MarketIndexDetail.init() {
    return MarketIndexDetail();
  }
}