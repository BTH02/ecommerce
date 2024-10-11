import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

import '../modal/data.dart';
import '../modal/product.dart';
class Completed extends StatefulWidget {
  const Completed({super.key, required this.product});
  final Product product;

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return _Completed(
            reviewItem: product,
            onTap: () {
              final arg = productList[index];
              Navigator.pushNamed(context, Routes.leaveReview,arguments: arg);
            },
          );
        },
      ),
    );
  }
}

class _Completed extends StatelessWidget {
  const _Completed({super.key, required this.reviewItem, this.onTap,});
  final Product reviewItem;
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
                    reviewItem.pathImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reviewItem.name),
                  const Text('Size:'),
                  Row(
                    children: [
                      Text(reviewItem.price.toString()),
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
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(20),left: Radius.circular(20)),
                          ),
                          child: const Center(child: Text('Leave Review',style: TextStyle(color: Colors.white,fontSize: 13),)),
                        ),
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
  }
}
