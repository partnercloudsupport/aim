import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class StockQuote {
  final String zqdm;
  final double dqj;
  final double zsj;
  final double jkj;

  StockQuote(this.zqdm, this.dqj, this.zsj, this.jkj);

  factory StockQuote.fromJson(Map<String, dynamic> json) => _$StockQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$StockQuoteToJson(this);
}

@JsonSerializable()
class StockQuotes {
  int total;
  List<StockQuote> items;

  StockQuotes(this.total, this.items);

  factory StockQuotes.fromJson(Map<String, dynamic> json) => _$StockQuotesFromJson(json);
  Map<String, dynamic> toJson() => _$StockQuotesToJson(this);
}

@JsonSerializable()
class ProtocolStockQuote {
  int status;
  String msg;
  StockQuotes data;

  String get dqj {
    if(data==null || data.items.length == 0){
      return '--';
    }
    return data.items[0].dqj.toString();
  }

  String get zsj {
    if(data==null || data.items.length == 0){
      return '--';
    }
    return data.items[0].zsj.toString();
  }

  String get jkj {
    if(data==null || data.items.length == 0){
      return '--';
    }
    return data.items[0].jkj.toString();
  }

  ProtocolStockQuote(this.status, this.msg, this.data);

  factory ProtocolStockQuote.fromJson(Map<String, dynamic> json) => _$ProtocolStockQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$ProtocolStockQuoteToJson(this);
}


class ModelQuote {
  final String name;
  final String code;
  final String dqj;
  final String zdf;
  final String jkj;
  final String zsj;

  ModelQuote({this.name, this.code, this.dqj, this.zdf, this.jkj, this.zsj});
}
