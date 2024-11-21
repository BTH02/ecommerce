import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/ui/06/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductSale extends StatefulWidget {
  const ProductSale({super.key});

  @override
  State<ProductSale> createState() => _ProductSaleState();
}

class _ProductSaleState extends State<ProductSale> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // Hủy ScrollController khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('product-sale').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Center(child: Text("Lỗi: ${snapshot.error}"));
            }
            final products = snapshot.data!.docs;
            return Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  String productId = products[index].id;
                  final user = FirebaseAuth.instance.currentUser;
                  final userId = user?.uid;
                  Map<String, dynamic> productData = product.data();
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              productData: productData,
                              userId: userId.toString(),
                              productId: productId,
                            ),
                          ));
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 170,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: '${product['images'][0]}',
                                    ),
                                    Positioned(
                                      top: 17,
                                      right: 8,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.horizontal(right: Radius.circular(10),left: Radius.circular(10))),
                                        child: Image.asset('images/flashsale.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: Text(
                                      product['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text('${product['rating']}')
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '\$${product['price-sale']}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 3),
                            ),
                            Text('\$${product['price']}')
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        });
  }
}
