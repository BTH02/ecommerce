import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modal/data.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back)),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Text('Check Out'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Shipping Address'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 25),
                          child: const Text('HM DP HN')),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20)),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: const Center(child: Text('CHANGE')),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 0.01,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Choose Shipping Type'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset('images/ship.png')),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Economy',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 35),
                          child: const Text('HM DP HN')),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20)),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: const Center(child: Text('CHANGE')),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 0.01,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Order List'),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            width: 110,
                            height: 110,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20)),
                              child: Image.asset(
                                product.pathImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name),
                              const Text('Size:'),
                              Row(
                                children: [
                                  Text(product.price.toString()),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 0.01,
                      endIndent: 20,
                      indent: 20,
                    ),
                  ],
                );
              },
            )
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
            child: const Center(child: Text('Continue to Payment',style: TextStyle(color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}
