import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';
class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            const SizedBox(height: 60,),
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
                const Text('Payment'),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Center(
                  child: SizedBox(
                    width: 100,
                      height: 100,
                      child: Image.asset('images/correct.png',color: Colors.white,),
                  ),
                )
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Payment Successful!'),
            const SizedBox(height: 20,),
            const Text('Thank you for your purchase'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 115,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.myOrder),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20), right: Radius.circular(20))),
                  child: const Center(
                      child: Text(
                        'View Order',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(height: 10,),
              const Text('View E-Receipt'),
            ],
          ),
        ),
      ),
    );
  }
}
