import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../06/api_wishlist.dart';
import '../06/product_detail.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Gap(60),
              const Row(
                children: [
                  Gap(120),
                  Text('Yêu thích'),
                ],
              ),
              const Gap(30),
              SizedBox(
                height: 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildScroll('All'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Jacket'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Dress'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Pant'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('T-Shirt'),
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .collection('favourite')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const SizedBox(
                      height: 250,
                      child: Center(
                        child: Text('Yêu thích trống!'),
                      ),
                    );
                  }
                  final favouriteItems = snapshot.data!.docs;
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
                    itemCount: favouriteItems.length,
                    itemBuilder: (context, index) {
                      final product = favouriteItems[index];
                      String productId = favouriteItems[index].id;
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
                        child: Column(
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
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () {
                                            deleteFavouriteItem(productId);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Sản phẩm đã được xóa bỏ yêu thích!')),
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
                },
              ),
              const Gap(100)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildScroll(String text) {
  return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(20), left: Radius.circular(20))),
      child: Center(child: Text(text)));
}
