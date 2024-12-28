import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:ecommerce/ui/09/api_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/generated/l10n.dart';
import '../../shared/logger/logger.dart';
import '../08/bloc/my_cart_bloc.dart';

class Payment extends StatefulWidget {
  const Payment({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                const Text('Phương thức thanh toán'),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.buildbottom),
                    icon: const Icon(Icons.home_outlined),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Thẻ tín dụng & Thẻ ghi nợ'),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(15),
                  left: Radius.circular(15),
                ),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset('images/payment.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Thêm thẻ'),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Tùy chọn thanh toán khác'),
            const SizedBox(
              height: 10,
            ),
            Table(
              children: [
                TableRow(children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: const _PaymentMethod(
                      namePay: 'Paypal',
                      nameImg: 'images/paypal.png',
                      value: false,
                      disable: true,
                    ),
                  )
                ]),
                TableRow(children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black),
                    ),
                    child: const _PaymentMethod(
                      namePay: 'Apple Pay',
                      nameImg: 'images/apple.png',
                      value: false,
                      disable: true,
                    ),
                  )
                ]),
                TableRow(children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: const _PaymentMethod(
                      namePay: 'Zalo Pay',
                      nameImg: 'images/zalopay.png',
                      value: true,
                    ),
                  )
                ]),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Container(
            width: 250,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                context.read<MyCartBloc>().add(
                      CreateOrder(
                        price: widget.totalPrice,
                        onSuccess: (zptoken) {
                          _paymentZaloPay(
                            zptoken,
                            onSuccessCallback: () async {
                              await moveCartToOrders();
                              context.showSnackBarInfo("Đặt hàng thành công!");
                              Navigator.pushNamed(
                                  context, Routes.paymentSuccess);
                            },
                          );
                        },
                      ),
                    );
              },
              child: Center(
                child: Text(
                  L.current.lbl_payment_confirm,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _paymentZaloPay(
    String? zptoken, {
    required VoidCallback onSuccessCallback,
  }) async {
    try {
      const MethodChannel platform =
          MethodChannel('com.example.flutter_zalopay/payOrder');
      final result =
          await platform.invokeMethod('payOrder', {"zptoken": zptoken});
      logger.w(result);
      if (result == true) {
        onSuccessCallback.call();
      }
    } catch (e) {
      logger.e(e);
    }
  }
}

class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod({
    required this.namePay,
    required this.nameImg,
    required this.value,
    this.disable = false,
  });

  final String namePay;
  final String nameImg;
  final bool value;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disable,
      child: Opacity(
        opacity: disable ? 0.5 : 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(nameImg),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(namePay),
                ],
              ),
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: true,
                  groupValue: value,
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
