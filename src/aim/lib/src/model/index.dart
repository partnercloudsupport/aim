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

  String getZqdm() => zqdm??'--';
  String getZqmc() => zqmc??'--';
  String getJkj() => jkj!=null ? jkj.toStringAsFixed(2) : '--';
  String getZsj() => zsj!=null ? zsj.toStringAsFixed(2) : '--';
  String getDqj() => dqj!=null ? dqj.toStringAsFixed(2) : '--';
  String getZgj() => zgj!=null ? zgj.toStringAsFixed(2) : '--';
  String getZdj() => zdj!=null ? zdj.toStringAsFixed(2) : '--';
  String getZtj() => ztj!=null ? ztj.toStringAsFixed(2) : '--';
  String getDtj() => dtj!=null ? dtj.toStringAsFixed(2) : '--';
  String getCjl() => cjl!=null ? cjl.toString() : '--';
  String getCje() => cje!=null ? cje.toStringAsFixed(2) : '--';
  String getTime() => time!=null ? time : '--';
  String getZde() => zde!=null ? zde.toStringAsFixed(2) : '--';   // 涨跌额
  String getZdf() => zdf!=null ? '${(100*zdf).toStringAsFixed(2)}%' : '--';   // 涨跌幅

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

  factory ModelIndexes.fromJson(Map<String, dynamic> json) => _$ModelIndexesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexesToJson(this);

  static ModelIndexes parse(json) => ModelIndexes.fromJson(json);
}

