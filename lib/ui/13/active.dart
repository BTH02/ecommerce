import 'package:flutter/material.dart';

import '../modal/data.dart';
class Active extends StatefulWidget {
  const Active({super.key});

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
                          product.pathImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
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
                            Container(
                              width: 90,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(20),left: Radius.circular(20)),
                              ),
                              child: const Center(child: Text('Track Order',style: TextStyle(color: Colors.white,fontSize: 13),)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(
                  color: Colors.black,
                  height: 0.01,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
