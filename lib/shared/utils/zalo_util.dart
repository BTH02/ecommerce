import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../data/models/requests/create_order_request.dart';
import '../../data/models/requests/order_status_request.dart';

class ZaloPayUtil {
  const ZaloPayUtil._();

  static String key1 = 'sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn';
  static String key2 = 'trMrHtvjo6myautxDUiAcYsVtaeQ8nhf';

  static String getDescription() {
    return "Merchant Demo - Thanh toán đơn hàng";
  }

  static String getBankCode() => "JCB";

  static String getMacCreateOrder(CreateOrderRequest request) {
    final key = utf8.encode(key1);
    final macValue =
        '${request.appId}${request.appTransId}${request.appUser}${request.amount}${request.appTime}${request.embedData}${request.item}';

    final bytes = utf8.encode(macValue);

    final hmacSha256 = Hmac(sha256, key);
    return hmacSha256.convert(bytes).toString();
  }

  static String getMacCreateOrder2(String data) {
    final key = utf8.encode(key1);
    final bytes = utf8.encode(data);

    final hmacSha256 = Hmac(sha256, key);
    return hmacSha256.convert(bytes).toString();
  }

  static String getMacOrderStatus(OrderStatusRequest request) {
    final key = utf8.encode(key1);

    final macValue = '${request.appId}${request.appTransId}$key';

    final bytes = utf8.encode(macValue);

    final hmacSha256 = Hmac(sha256, key);
    return hmacSha256.convert(bytes).toString();
  }
}
