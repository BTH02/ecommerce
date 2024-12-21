import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_request.freezed.dart';

part 'order_status_request.g.dart';

@freezed
class OrderStatusRequest with _$OrderStatusRequest {
  factory OrderStatusRequest({
    @JsonKey(name: 'app_id') required int appId,
    @JsonKey(name: 'app_trans_id') required String appTransId,
    @JsonKey(name: 'mac') required String mac,
  }) = _OrderStatusRequest;

  factory OrderStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusRequestFromJson(json);
}
