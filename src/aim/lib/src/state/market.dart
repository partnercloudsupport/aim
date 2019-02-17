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

  MarketStocks copyWith({Map<String, ModelStock> stocks, DataStatus status, String tip}) {
    return MarketStocks(
      stocks: stocks??this.stocks,
      status: status??this.status,
      tip: tip??this.tip
    );
  }

  MarketStocks updateWith(dynamic obj) {
    if (obj is ModelStock) {
      this.stocks[obj.id] = obj;
    } else if( obj is ModelQuote) {
      this.stocks[obj.zqdm]?.quote = obj;
    } else if (obj is List<ModelQuote>) {
      obj.forEach((quote){this.stocks[quote.zqdm]?.quote=quote;});
    }

    return this;
  }

  List<ModelStock> selectByIds(List<String> ids) {
    List<ModelStock> stocks = [];
    ids?.forEach((id){
      var stock = this.stocks??this.stocks[id];
      if (stock != null) {
        stocks.add(stock);
      }
    });
    return stocks;
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

  MarketStockDetail copyWith({ModelStockDetail stock, DataStatus status, String tip}) {
    return MarketStockDetail(
      stock: stock??this.stock,
      status: status??this.status,
      tip: tip??this.tip
    );
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

  MarketIndexes updateWith(dynamic obj) {
    if (obj is ModelIndex) {
      this.indexes[obj.id] = obj;
    } else if( obj is ModelQuote) {
      this.indexes[obj.zqdm]?.quote = obj;
    } else if (obj is List<ModelQuote>) {
      obj.forEach((quote){this.indexes[quote.zqdm]?.quote=quote;});
    }

    return this;
  }

  List<ModelIndex> take(int count) {
    return this.indexes.values.take(3).toList();
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

  MarketIndexDetail copyWith({ModelIndexDetail index, DataStatus status, String tip}) {
    return MarketIndexDetail(
        index: index??this.index,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}