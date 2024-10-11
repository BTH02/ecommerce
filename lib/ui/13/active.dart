import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

import '../modal/data.dart';
import '../modal/product.dart';

class Active extends StatefulWidget {
  const Active({super.key, required this.product});

  final Product product;

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return _Active(
            productTrack: product,
            onTap: () {
              final arg = productList[index];
              Navigator.pushNamed(context, Routes.trackReview,arguments: arg);
            },
          );
        },
      ),
    );
  }
}

class _Active extends StatelessWidget {
  const _Active({super.key, required this.productTrack, this.onTap});

  final Product productTrack;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20)),
                  child: Image.asset(
                    productTrack.pathImage,
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
                  Text(productTrack.name),
                  const Text('Size:'),
                  Row(
                    children: [
                      Text(productTrack.price.toString()),
                      const SizedBox(
                        width: 70,
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: 90,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20),
                                left: Radius.circular(20)),
                          ),
                          child: const Center(
                              child: Text(
                            'Track Order',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 0.01,
          )
        ],
      ),
    );
  }
}
