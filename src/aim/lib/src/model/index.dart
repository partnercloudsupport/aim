import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';


@JsonSerializable()
class ModelIndex {
  String zqdm; // 证券代码
  String zqmc; // 证券名称
  double jkj; // 今开价
  double zsj; // 昨收价
  double dqj; // 当前价
  double zgj; // 最高价
  double zdj; // 最低价
  double ztj; // 涨停价
  double dtj; // 跌停价
  int cjl; // 成交量，单位：手
  double cje; // 成交额，单位：元
  String time; // 数据时间

  ModelIndex(this.zqdm, this.zqmc, this.jkj, this.zsj, this.dqj, this.zgj, this.zdj, this.ztj, this.dtj, this.cjl, this.cje, this.time);

  double get zde {
    if(dqj == null || zsj == null){
      return null;
    }
    return dqj-zsj;
  }

  double get zdf {
    if(dqj == null || zsj == null || zsj==0.0){
      return null;
    }
    return (dqj-zsj)/zsj;
  }

  String get strZqdm => zqdm??'--';
  String get strZqmc => zqmc??'--';

  String get strJkj => jkj!=null ? jkj.toStringAsFixed(2) : '--';
  String get strZsj => zsj!=null ? zsj.toStringAsFixed(2) : '--';
  String get strDqj => dqj!=null ? dqj.toStringAsFixed(2) : '--';
  String get strZgj => zgj!=null ? zgj.toStringAsFixed(2) : '--';
  String get strZdj => zdj!=null ? zdj.toStringAsFixed(2) : '--';
  String get strZtj => ztj!=null ? ztj.toStringAsFixed(2) : '--';
  String get strDtj => dtj!=null ? dtj.toStringAsFixed(2) : '--';

  String get strCjl => cjl!=null ? cjl.toString() : '--';
  String get strCje => cje!=null ? cje.toStringAsFixed(2) : '--';

  String get strTime => time!=null ? time : '--';

  String get strZde {
    if(zde==null){
      return '--';
    }

    if(zde > 0) {
      return '+${zde.toStringAsFixed(2)}';
    } else {
      return zde.toStringAsFixed(2);
    }
  }

  String get strZdf {
    if(zdf==null){
      return '--';
    }

    if(zdf > 0) {
      return '+${(zdf*100).toStringAsFixed(2)}%';
    } else {
      return '${(zdf*100).toStringAsFixed(2)}%';
    }
  }

  void update(ModelIndex quote) {
    this.jkj = quote.jkj;
    this.zsj = quote.zsj;
    this.dqj = quote.dqj;
    this.zgj = quote.zgj;
    this.zdj = quote.zdj;
    this.dtj = quote.dtj;
    this.ztj = quote.ztj;
    this.cjl = quote.cjl;
    this.cje = quote.cje;
    this.time = quote.time;
  }

  factory ModelIndex.fromJson(Map<String, dynamic> json) => _$ModelIndexFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexToJson(this);
}

@JsonSerializable()
class ModelIndexes {
  int total;
  List<ModelIndex> items;

  ModelIndexes(this.total, this.items);

  ModelIndex get(int pos) {
    if (items==null || items.length<pos+1){
      return null;
    }
    return items[pos];
  }

  List<String> indexCodes() {
    if(items != null) {
      return items.map((item) {
        return item.zqdm;
      }).toList();
    }

    return null;
  }

  void update(ModelIndexes quotes) {
    if(quotes == null || quotes.items == null || this.items == null) {
      return;
    }

    for (var oldItem in items) {
      for (var newItem in quotes.items) {
        if(oldItem.zqdm == newItem.zqdm) {
          oldItem.update(newItem);
          break;
        }
      }
    }
  }

  factory ModelIndexes.fromJson(Map<String, dynamic> json) => _$ModelIndexesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexesToJson(this);

  static ModelIndexes parse(json) => ModelIndexes.fromJson(json);
}

