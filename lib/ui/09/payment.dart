import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

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
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text('Payment Methods'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Credit & Debit Card'),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(15), left: Radius.circular(15)),
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
                        const Text('Add Card'),
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
            const Text('More Payment Options'),
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
                            topRight: Radius.circular(15))),
                    child: _buildPayment('Paypal','images/paypal.png'),
                  )
                ]),
                TableRow(children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black),
                    ),
                    child: _buildPayment('Apple Pay','images/apple.png',),
                  )
                ]),
                TableRow(children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: _buildPayment('Zalo Pay','images/zalopay.png',),
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
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Center(
          child: Container(
            width: 250,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.paymentSuccess),
              child: const Center(
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPayment(String namePay,String nameImg){
  return Container(
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
            groupValue: true,
            onChanged: (value) {},
          ),
        )
      ],
    ),
  );
}