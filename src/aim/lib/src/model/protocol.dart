import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';


@JsonSerializable()
class Protocol {
  int status;
  String msg;
  dynamic data;


  Protocol(this.status, this.msg, this.data);

  factory Protocol.fromJson(Map<String, dynamic> json) => _$ProtocolFromJson(json);
  Map<String, dynamic> toJson() => _$ProtocolToJson(this);
}
