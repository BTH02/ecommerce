import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request.freezed.dart';

part 'create_order_request.g.dart';

@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  factory CreateOrderRequest({
    @JsonKey(name: 'app_id') required int appId,
    @JsonKey(name: 'app_user') required String appUser,
    @JsonKey(name: 'app_trans_id') required String appTransId,
    @JsonKey(name: 'app_time') required int appTime,
    @JsonKey(name: 'expire_duration_seconds') int? expireDurationSeconds,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'item') required List<Item> item,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'embed_data') required EmbedData embedData,
    @JsonKey(name: 'bank_code') required String bankCode,
    @JsonKey(name: 'mac') required String mac,
    @JsonKey(name: 'callback_url') String? callbackUrl,
    @JsonKey(name: 'device_info') String? deviceInfo,
    @JsonKey(name: 'sub_app_id') String? subAppId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'currency') String? currency,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') String? address,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    @JsonKey(name: 'item_id') required int itemId,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'item_price') required int itemPrice,
    @JsonKey(name: 'item_quantity') required int itemQuantity,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class EmbedData with _$EmbedData {
  factory EmbedData({
    @JsonKey(name: 'preferred_payment_method')
    List<String>? preferredPaymentMethod,
    @JsonKey(name: 'redirecturl') String? redirectUrl,
    @JsonKey(name: 'zlppaymentid') String? zlppaymentid,
  }) = _EmbedData;

  factory EmbedData.fromJson(Map<String, dynamic> json) =>
      _$EmbedDataFromJson(json);
}
