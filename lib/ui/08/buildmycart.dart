import 'package:flutter/material.dart';

import '../modal/data.dart';

class BuildMyCart extends StatefulWidget {
  const BuildMyCart({super.key});

  @override
  State<BuildMyCart> createState() => _BuildMyCartState();
}

class _BuildMyCartState extends State<BuildMyCart> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 130,
                height: 130,
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
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.horizontal(right: Radius.circular(10),left: Radius.circular(10))
                            ),
                            child: const Icon(Icons.remove,color: Colors.white,weight: 5,),
                          ),
                          const SizedBox(width: 5,),
                          const Text('1'),
                          const SizedBox(width: 5,),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(10),left: Radius.circular(10))
                            ),
                            child: const Icon(Icons.add,color: Colors.white,weight: 5,),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
