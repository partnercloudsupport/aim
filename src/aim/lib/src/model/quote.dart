import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';


@JsonSerializable()
class ModelQuote {
  String zqdm; // 证券代码
  String source; // 行情来源

  double jkj; // 今开价
  double zsj; // 昨收价
  double dqj; // 当前价
  double zgj; // 最高价
  double zdj; // 最低价
  double ztj; // 涨停价
  double dtj; // 跌停价

  int mcl5; // 卖五量
  double mcj5; //卖五价
  int mcl4; // 卖四量
  double mcj4; //卖四价
  int mcl3; // 卖三量
  double mcj3; //卖三价
  int mcl2; // 卖二量
  double mcj2; //卖二价
  int mcl1; // 卖一量
  double mcj1; //卖一价

  int mrl1; // 买一量
  double mrj1; //买一价
  int mrl2; // 买二量
  double mrj2; //买二价
  int mrl3; // 买三量
  double mrj3; //买三价
  int mrl4; // 买四量
  double mrj4; //买四价
  int mrl5; // 买五量
  double mrj5; //买五价

  int cjl; // 成交量，单位：手
  double cje; // 成交额，单位：元

  String time; // 数据时间

  ModelQuote(
      this.zqdm, this.source,
      this.jkj, this.zsj, this.dqj, this.zgj, this.zdj, this.ztj, this.dtj,
      this.mcl5, this.mcj5, this.mcl4, this.mcj4, this.mcl3, this.mcj3, this.mcl2, this.mcj2, this.mcl1, this.mcj1,
      this.mrl1, this.mrj1, this.mrl2, this.mrj2, this.mrl3, this.mrj3, this.mrl4, this.mrj4, this.mrl5, this.mrj5,
      this.cjl, this.cje,
      this.time);

  factory ModelQuote.initWith({
    String zqdm, String zqmc, String status, String limit, String url, String tidyjs, String source,
    double jkj, double zsj, double dqj, double zgj, double zdj, double ztj, double dtj,
    int mcl5, double mcj5, int mcl4, double mcj4, int mcl3, double mcj3, int mcl2, double mcj2, int mcl1, double mcj1,
    int mrl1, double mrj1, int mrl2, double mrj2, int mrl3, double mrj3, int mrl4, double mrj4, int mrl5, double mrj5,
    int cjl, double cje,
    String time}) {
    return ModelQuote(
        zqdm, source,
        jkj, zsj, dqj, zgj, zdj, ztj, dtj,
        mcl5, mcj5, mcl4, mcj4, mcl3, mcj3, mcl2, mcj2, mcl1, mcj1,
        mrl1, mrj1, mrl2, mrj2, mrl3, mrj3, mrl4, mrj4, mrl5, mrj5,
        cjl, cje,
        time);
  }

  double get zde {
    if (dqj == null || zsj == null) {
      return null;
    }
    return dqj - zsj;
  }

  double get zdf {
    if (dqj == null || zsj == null || zsj == 0.0) {
      return null;
    }
    return (dqj - zsj) / zsj;
  }

  String get strZqdm => zqdm ?? '--';
  String get strSource => source ?? '--';

  String get strJkj => jkj != null ? jkj.toStringAsFixed(2) : '--';
  String get strZsj => zsj != null ? zsj.toStringAsFixed(2) : '--';
  String get strDqj => dqj != null ? dqj.toStringAsFixed(2) : '--';
  String get strZgj => zgj != null ? zgj.toStringAsFixed(2) : '--';
  String get strZdj => zdj != null ? zdj.toStringAsFixed(2) : '--';
  String get strZtj => ztj != null ? ztj.toStringAsFixed(2) : '--';
  String get strDtj => dtj != null ? dtj.toStringAsFixed(2) : '--';

  String get strMcl5 => mcl5 != null ? mcl5.toString() : '--';
  String get strMcj5 => mcj5 != null ? mcj5.toStringAsFixed(2) : '--';
  String get strMcl4 => mcl4 != null ? mcl4.toString() : '--';
  String get strMcj4 => mcj4 != null ? mcj4.toStringAsFixed(2) : '--';
  String get strMcl3 => mcl3 != null ? mcl3.toString() : '--';
  String get strMcj3 => mcj3 != null ? mcj3.toStringAsFixed(2) : '--';
  String get strMcl2 => mcl2 != null ? mcl2.toString() : '--';
  String get strMcj2 => mcj2 != null ? mcj2.toStringAsFixed(2) : '--';
  String get strMcl1 => mcl1 != null ? mcl1.toString() : '--';
  String get strMcj1 => mcj1 != null ? mcj1.toStringAsFixed(2) : '--';

  String get strMrl1 => mrl1 != null ? mrl1.toString() : '--';
  String get strMrj1 => mrj1 != null ? mrj1.toStringAsFixed(2) : '--';
  String get strMrl2 => mrl2 != null ? mrl2.toString() : '--';
  String get strMrj2 => mrj2 != null ? mrj2.toStringAsFixed(2) : '--';
  String get strMrl3 => mrl3 != null ? mrl3.toString() : '--';
  String get strMrj3 => mrj3 != null ? mrj3.toStringAsFixed(2) : '--';
  String get strMrl4 => mrl4 != null ? mrl4.toString() : '--';
  String get strMrj4 => mrj4 != null ? mrj4.toStringAsFixed(2) : '--';
  String get strMrl5 => mrl5 != null ? mrl5.toString() : '--';
  String get strMrj5 => mrj5 != null ? mrj5.toStringAsFixed(2) : '--';

  String get strCjl => cjl != null ? cjl.toString() : '--';
  String get strCje => cje != null ? cje.toStringAsFixed(2) : '--';

  String get strTime => time != null ? time : '--';

  String get strZde => zde != null ? zde.toStringAsFixed(2) : '--'; // 涨跌额
  String get strZdf => zdf != null ? '${(100 * zdf).toStringAsFixed(2)}%' : '--'; // 涨跌幅

  factory ModelQuote.fromJson(Map<String, dynamic> json) => _$ModelQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$ModelQuoteToJson(this);
}

@JsonSerializable()
class ModelQuotes {
  int total;
  List<ModelQuote> items;

  ModelQuotes(this.total, this.items);

  factory ModelQuotes.fromJson(Map<String, dynamic> json) => _$ModelQuotesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelQuotesToJson(this);
}