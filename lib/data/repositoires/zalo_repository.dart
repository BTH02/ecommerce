import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/utils/date_time_util.dart';
import '../../shared/utils/zalo_util.dart';
import '../models/create_order_response.dart';

class PaymentRepository {
  Future<CreateOrderResponse?> createOrder(double price) async {
    try {
      final Map<String, String> headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };

      final Map<String, dynamic> body = {
        'app_id': 2554.toString(),
        'app_user': 'zalopaydemo',
        'app_trans_id': DateTimeUtil.getCurrentDateString("yyMMdd_hhmmss"),
        'app_time': DateTime.now().millisecondsSinceEpoch.toString(),
        'amount': price.toStringAsFixed(0),
        'item': '[]',
        'description': ZaloPayUtil.getDescription(),
        'embed_data': "{}",
        'bank_code': 'JCB',
      };

      final String hmacInput =
          "${body['app_id']}|${body['app_trans_id']}|${body['app_user']}|${body['amount']}|${body['app_time']}|${body['embed_data']}|${body['item']}";

      body['mac'] = ZaloPayUtil.getMacCreateOrder2(hmacInput);

      final client = http.Client();

      final response = await client.post(
        Uri.parse('https://sb-openapi.zalopay.vn/v2/create'),
        headers: headers,
        body: body,
      );

      if (response.statusCode != 200) {
        return null;
      }

      final data = jsonDecode(response.body);

      return CreateOrderResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
