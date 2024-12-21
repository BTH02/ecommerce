// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderRequestImpl _$$CreateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderRequestImpl(
      appId: (json['app_id'] as num).toInt(),
      appUser: json['app_user'] as String,
      appTransId: json['app_trans_id'] as String,
      appTime: (json['app_time'] as num).toInt(),
      expireDurationSeconds: (json['expire_duration_seconds'] as num?)?.toInt(),
      amount: (json['amount'] as num).toInt(),
      item: (json['item'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      embedData: EmbedData.fromJson(json['embed_data'] as Map<String, dynamic>),
      bankCode: json['bank_code'] as String,
      mac: json['mac'] as String,
      callbackUrl: json['callback_url'] as String?,
      deviceInfo: json['device_info'] as String?,
      subAppId: json['sub_app_id'] as String?,
      title: json['title'] as String?,
      currency: json['currency'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$CreateOrderRequestImplToJson(
        _$CreateOrderRequestImpl instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'app_user': instance.appUser,
      'app_trans_id': instance.appTransId,
      'app_time': instance.appTime,
      'expire_duration_seconds': instance.expireDurationSeconds,
      'amount': instance.amount,
      'item': instance.item,
      'description': instance.description,
      'embed_data': instance.embedData,
      'bank_code': instance.bankCode,
      'mac': instance.mac,
      'callback_url': instance.callbackUrl,
      'device_info': instance.deviceInfo,
      'sub_app_id': instance.subAppId,
      'title': instance.title,
      'currency': instance.currency,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      itemId: (json['item_id'] as num).toInt(),
      itemName: json['item_name'] as String,
      itemPrice: (json['item_price'] as num).toInt(),
      itemQuantity: (json['item_quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'item_price': instance.itemPrice,
      'item_quantity': instance.itemQuantity,
    };

_$EmbedDataImpl _$$EmbedDataImplFromJson(Map<String, dynamic> json) =>
    _$EmbedDataImpl(
      preferredPaymentMethod:
          (json['preferred_payment_method'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      redirectUrl: json['redirecturl'] as String?,
      zlppaymentid: json['zlppaymentid'] as String?,
    );

Map<String, dynamic> _$$EmbedDataImplToJson(_$EmbedDataImpl instance) =>
    <String, dynamic>{
      'preferred_payment_method': instance.preferredPaymentMethod,
      'redirecturl': instance.redirectUrl,
      'zlppaymentid': instance.zlppaymentid,
    };
