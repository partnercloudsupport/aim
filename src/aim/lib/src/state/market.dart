import 'base.dart';
export 'base.dart';
import '../model/index.dart';
import '../model/stock.dart';
import '../model/quote.dart';

// market data
class Market {
  // market index data
  MarketIndex index;
  // market stock data
  MarketStock stock;
  // market search data
  MarketSearch search;

  Market({this.index, this.stock, this.search});

  factory Market.init() {
    return Market(
      index: MarketIndex.init(),
      stock: MarketStock.init(),
      search: MarketSearch.init()
    );
  }
}

// market index data
class MarketIndex {
  // market indexes
  MarketIndexes indexes;
  // main index list
  MarketMainIndexes mainIndexes;

  MarketIndex({this.indexes, this.mainIndexes});

  factory MarketIndex.init() {
    return MarketIndex(
      indexes: MarketIndexes.init(),
      mainIndexes: MarketMainIndexes.init(),
    );
  }
}

// market indexes
class MarketIndexes {
  // market indexes
  Map<String, ModelIndex> indexes;

  MarketIndexes({this.indexes});

  factory MarketIndexes.init() {
    return MarketIndexes(
      indexes: {}
    );
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

// market main indexes
class MarketMainIndexes extends StateBase {
  // main indexes
  List<String> indexes;

  MarketMainIndexes({this.indexes, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory MarketMainIndexes.init() {
    return MarketMainIndexes(
      indexes: [],
      status: ActionStatus.todo
    );
  }

  MarketMainIndexes copyWith({List<ModelIndex> indexes, ActionStatus status, String tip}) {
    return MarketMainIndexes(
        indexes: indexes??this.indexes,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

// market stock data
class MarketStock {
  // market stocks
  MarketStocks stocks;
  // state for get current stock quote
  MarketStockQuote quote;

  MarketStock({this.stocks, this.quote});

  factory MarketStock.init() {
    return MarketStock(
      stocks: MarketStocks.init(),
      quote: MarketStockQuote.init()
    );
  }
}

class MarketStocks {
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




class MarketStockQuote extends StateBase {
  String id;

  MarketStockQuote({this.id, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory MarketStockQuote.init() {
    return MarketStockQuote(
        status: ActionStatus.todo
    );
  }

  MarketStockQuote copyWith({String id, ActionStatus status, String tip}) {
    return MarketStockQuote(
        id: id??this.id,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}


// market search data
class MarketSearch {
  // search stock collections
  MarketSearchStocks stocks;
  // user search history
  MarketSearchHistory history;
  // hottest search stocks
  MarketSearchHottest hottest;
  // current search results
  MarketSearchResults results;

  MarketSearch({this.history, this.hottest, this.results});

  factory MarketSearch.init() {
    return MarketSearch(
      history: MarketSearchHistory.init(),
      hottest: MarketSearchHottest.init(),
      results: MarketSearchResults.init()
    );
  }
}

class MarketSearchStocks extends StateBase {
  List<ModelSearchStock> stocks;

  MarketSearchStocks({this.stocks, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory MarketSearchStocks.init() {
    return MarketSearchStocks(
        stocks: [],
        status: ActionStatus.todo
    );
  }

  MarketSearchStocks copyWith({List<String> stocks, ActionStatus status, String tip}) {
    return MarketSearchStocks(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

class MarketSearchHistory extends StateBase {
  List<String> stocks;

  MarketSearchHistory({this.stocks, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory MarketSearchHistory.init() {
    return MarketSearchHistory(
      stocks: [],
      status: ActionStatus.todo
    );
  }

  MarketSearchHistory copyWith({List<String> stocks, ActionStatus status, String tip}) {
    return MarketSearchHistory(
      stocks: stocks??this.stocks,
      status: status??this.status,
      tip: tip??this.tip
    );
  }
}

class MarketSearchHottest extends StateBase {
  List<String> stocks;

  MarketSearchHottest({this.stocks, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory MarketSearchHottest.init() {
    return MarketSearchHottest(
        stocks: [],
        status: ActionStatus.todo
    );
  }

  MarketSearchHottest copyWith({List<String> stocks, ActionStatus status, String tip}) {
    return MarketSearchHottest(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}

class MarketSearchResults extends StateBase {
  List<String> stocks;

  MarketSearchResults({this.stocks, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory MarketSearchResults.init() {
    return MarketSearchResults(
        stocks: [],
        status: ActionStatus.todo
    );
  }

  MarketSearchResults copyWith({List<String> stocks, ActionStatus status, String tip}) {
    return MarketSearchResults(
        stocks: stocks??this.stocks,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}
