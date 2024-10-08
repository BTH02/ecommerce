import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/modal/data.dart';
import 'package:flutter/material.dart';

import '../modal/product.dart';

class ProductHome extends StatelessWidget {
  const ProductHome({super.key, required this.product});
  final Product product;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return _ProductHome(
          productItem: product,
          onTap: () {
            final arg = productList[index];
            Navigator.pushNamed(context, Routes.productDetail,arguments: arg);
          },
        );
      },
    );
  }
}

class _ProductHome extends StatelessWidget {
  const _ProductHome({super.key, required this.productItem, this.onTap});
  final Product productItem;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 170,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    productItem.pathImage,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        child: const Icon(Icons.favorite_border)),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productItem.name),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text('${productItem.vote}')
                ],
              ),
            ],
          ),
          Text('\$${productItem.price}')
        ],
      ),
    );
  }
}
