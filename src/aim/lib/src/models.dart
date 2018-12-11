import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';


@JsonSerializable()
class NewsChannel {
  int id;
  String name;

  NewsChannel(this.id, this.name);

  factory NewsChannel.fromJson(Map<String, dynamic> json) => _$NewsChannelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsChannelToJson(this);
}