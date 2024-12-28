// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStatusRequestImpl _$$OrderStatusRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusRequestImpl(
      appId: (json['app_id'] as num).toInt(),
      appTransId: json['app_trans_id'] as String,
      mac: json['mac'] as String,
    );

Map<String, dynamic> _$$OrderStatusRequestImplToJson(
        _$OrderStatusRequestImpl instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'app_trans_id': instance.appTransId,
      'mac': instance.mac,
    };
