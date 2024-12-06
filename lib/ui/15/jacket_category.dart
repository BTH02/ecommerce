import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../06/api_wishlist.dart';
import '../06/product_detail.dart';

class JacketCategory extends StatelessWidget {
  const JacketCategory({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: Stack(children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(100),
                StreamBuilder(
                    stream: firestore
                        .collection('product')
                        .where('categoryId',
                            isEqualTo: categoryId) // Lọc theo categoryID
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                              ConnectionState.done ||
                          snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasError) {
                          return Center(child: Text("Lỗi: ${snapshot.error}"));
                        }
                        final products = snapshot.data!.docs;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                final user = FirebaseAuth.instance.currentUser;
                                final userId = user?.uid;
                                String productId = products[index].id;
                                Map<String, dynamic> productData =
                                    product.data();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                          productData: productData,
                                          userId: userId.toString(),
                                          productId: productId),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 170,
                                    child: ClipRRect(
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                              left: Radius.circular(20),
                                              right: Radius.circular(20)),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: '${product['images'][0]}',
                                          ),
                                          Positioned(
                                              top: 10,
                                              right: 0,
                                              child: IconButton(
                                                onPressed: () {
                                                  addProductWishList(FirebaseAuth.instance.currentUser!.uid,product.id);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                        content:
                                                        Text('Sản phẩm đã được thêm vào yêu thích!')),
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                  Text('\$${product['price']}')
                                ],
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    })
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 50,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
              ),
              const Gap(90),
              const Text('Áo khoác'),
            ],
          ),
        ),
      ]),
    );
  }
}
