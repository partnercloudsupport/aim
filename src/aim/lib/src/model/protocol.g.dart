// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Protocol _$ProtocolFromJson(Map<String, dynamic> json) {
  return Protocol(json['status'] as int, json['msg'] as String, json['data']);
}

Map<String, dynamic> _$ProtocolToJson(Protocol instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data
    };
