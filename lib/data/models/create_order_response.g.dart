// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderResponseImpl _$$CreateOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderResponseImpl(
      returnCode: (json['return_code'] as num?)?.toInt(),
      returnMessage: json['return_message'] as String?,
      subReturnCode: (json['sub_return_code'] as num?)?.toInt(),
      subReturnMessage: json['sub_return_message'] as String?,
      orderUrl: json['order_url'] as String?,
      zpTransToken: json['zp_trans_token'] as String?,
      orderToken: json['order_token'] as String?,
      qrCode: json['qr_code'] as String?,
    );

Map<String, dynamic> _$$CreateOrderResponseImplToJson(
        _$CreateOrderResponseImpl instance) =>
    <String, dynamic>{
      'return_code': instance.returnCode,
      'return_message': instance.returnMessage,
      'sub_return_code': instance.subReturnCode,
      'sub_return_message': instance.subReturnMessage,
      'order_url': instance.orderUrl,
      'zp_trans_token': instance.zpTransToken,
      'order_token': instance.orderToken,
      'qr_code': instance.qrCode,
    };
