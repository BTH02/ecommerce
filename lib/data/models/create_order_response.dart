import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_response.freezed.dart';

part 'create_order_response.g.dart';

@freezed
class CreateOrderResponse with _$CreateOrderResponse {
  factory CreateOrderResponse({
    @JsonKey(name: 'return_code') int? returnCode,
    @JsonKey(name: 'return_message') String? returnMessage,
    @JsonKey(name: 'sub_return_code') int? subReturnCode,
    @JsonKey(name: 'sub_return_message') String? subReturnMessage,
    @JsonKey(name: 'order_url') String? orderUrl,
    @JsonKey(name: 'zp_trans_token') String? zpTransToken,
    @JsonKey(name: 'order_token') String? orderToken,
    @JsonKey(name: 'qr_code') String? qrCode,
  }) = _CreateOrderResponse;

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
}
