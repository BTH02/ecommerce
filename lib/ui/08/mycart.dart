import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/08/buildmycart.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const SizedBox(
                    width: 75,
                  ),
                  const Text('My Cart'),
                ],
              ),
            ),
            const BuildMyCart(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 255,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(25), left: Radius.circular(25)),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 45,
                      width: 100,
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'Promo Code', border: InputBorder.none),
                      ),
                    ),
                    Container(
                        margin:
                            const EdgeInsets.only(right: 5, top: 3, bottom: 3),
                        height: 45,
                        width: 70,
                        decoration: const BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(25),
                                left: Radius.circular(25))),
                        child: const Center(
                            child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub-Total'),
                  Text('\$ 407.47'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery Free'),
                  Text('\$ 407.47'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount'),
                  Text('\$ 407.47'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(15, (index) {
                    return Container(
                      width: 10,
                      height: 1,
                      color: Colors.black,
                      margin: const EdgeInsets.only(right: 3),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Cost'),
                  Text('\$ 407.47'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 45,
                  decoration: const BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(25),
                          left: Radius.circular(25))),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.checkout),
                    child: const Center(
                      child: Text(
                        'Proceed to Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

