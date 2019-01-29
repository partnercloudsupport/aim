import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ModelUser {
  // session id
  final String sid;
  // user id
  final String uid;

  ModelUser(this.sid, this.uid);

  factory ModelUser.fromJson(Map<String, dynamic> json) => _$ModelUserFromJson(json);
  Map<String, dynamic> toJson() => _$ModelUserToJson(this);
}
