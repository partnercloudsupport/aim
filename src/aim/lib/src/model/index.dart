import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class ModelIndex {
  String zqdm; // 证券代码
  String zqmc; // 证券名称
  String source; // 行情来源
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

  ModelIndex(this.zqdm, this.zqmc, this.source, this.jkj, this.zsj, this.dqj, this.zgj, this.zdj, this.ztj, this.dtj, this.cjl, this.cje, this.time);
  ModelIndex updateWith(ModelIndex other) {
    return ModelIndex(
      other.zqdm??this.zqdm,
      other.zqmc??this.zqmc,
        other.source??this.source,
        other.jkj??this.jkj,
        other.zsj??this.zsj,
        other.dqj??this.dqj,
        other.zgj??this.zgj,
        other.zdj??this.zdj,
        other.ztj??this.ztj,
        other.dtj??this.dtj,
        other.cjl??this.cjl,
        other.cje??this.cje,
        other.time??this.time
    );
  }

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
  String get strSource => source??'--';

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


  factory ModelIndex.fromJson(Map<String, dynamic> json) => _$ModelIndexFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexToJson(this);
}

@JsonSerializable()
class ModelIndexes {
  int total;
  List<ModelIndex> items;

  ModelIndexes(this.total, this.items);

  ModelIndexes updateWith(List<ModelIndex> others) {
    var mothers = Map.fromIterable(others, key: (item){return item.zqdm;});
    var items = this.items?.map((item){
      if(mothers.containsKey(item.zqdm))
        return item.updateWith(mothers[item.zqdm]);
      else
        return item;
    })?.toList();

    return ModelIndexes(this.total,  items??this.items);
  }

  ModelIndex get(int pos) {
    if (items==null || items.length<pos+1){
      return null;
    }
    return items[pos];
  }

  List<String> codes() {
    if(items != null) {
      return items.map((item) {
        return item.zqdm;
      }).toList();
    }

    return null;
  }

  factory ModelIndexes.fromJson(Map<String, dynamic> json) => _$ModelIndexesFromJson(json);
  Map<String, dynamic> toJson() => _$ModelIndexesToJson(this);
}

