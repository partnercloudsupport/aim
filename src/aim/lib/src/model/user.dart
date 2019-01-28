import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ModelSession {
  final String sid;
  ModelSession(this.sid);

  factory ModelSession.fromJson(Map<String, dynamic> json) => _$ModelSessionFromJson(json);
  Map<String, dynamic> toJson() => _$ModelSessionToJson(this);
}
