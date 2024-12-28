import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:ecommerce/ui/08/my_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'api_mycart.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    required this.productData,
    required this.userId,
    required this.productId,
  });

  final Map<String, dynamic> productData;
  final String userId;

  final String productId;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String selectedSize = '';
  List<String> sizes = [];
  String selectedColor = '';
  List<String> colors = [];

  @override
  void initState() {
    super.initState();
    loadSizes();
    loadColors();
  }

  void loadSizes() async {
    sizes = await fetchSizes(widget.productId);
    setState(() {});
  }

  void loadColors() async {
    colors = await fetchColors(widget.productId);
    setState(() {});
  }

  Future<List<String>> fetchSizes(String productId) async {
    List<String> sizeList = [];

    try {
      // Truy vấn kích thước từ collection 'product'
      DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .get();

      if (productSnapshot.exists) {
        List<dynamic> productSizes = productSnapshot['size'];
        sizeList.addAll(List<String>.from(productSizes));
      }

      // Truy vấn kích thước từ collection 'productsale'
      DocumentSnapshot saleSnapshot = await FirebaseFirestore.instance
          .collection('product-sale')
          .doc(
              productId) // Nếu `productId` trùng với tài liệu trong `productsale`
          .get();

      if (saleSnapshot.exists) {
        List<dynamic> saleSizes = saleSnapshot['size'];
        sizeList.addAll(List<String>.from(saleSizes));
      }

      // Loại bỏ kích thước trùng lặp (nếu có)
      sizeList = sizeList.toSet().toList();
    } catch (e) {
      print("Lỗi khi lấy danh sách size: $e");
    }

    return sizeList;
  }

  Future<List<String>> fetchColors(String productId) async {
    List<String> colorList = [];

    try {
      // Truy vấn kích thước từ collection 'product'
      DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .get();

      if (productSnapshot.exists) {
        List<dynamic> productSizes = productSnapshot['color'];
        colorList.addAll(List<String>.from(productSizes));
      }

      // Truy vấn kích thước từ collection 'productsale'
      DocumentSnapshot saleSnapshot = await FirebaseFirestore.instance
          .collection('product-sale')
          .doc(
              productId) // Nếu `productId` trùng với tài liệu trong `productsale`
          .get();

      if (saleSnapshot.exists) {
        List<dynamic> saleSizes = saleSnapshot['color'];
        colorList.addAll(List<String>.from(saleSizes));
      }

      // Loại bỏ kích thước trùng lặp (nếu có)
      colorList = colorList.toSet().toList();
    } catch (e) {
      print("Lỗi khi lấy danh sách size: $e");
    }

    return colorList;
  }

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: CachedNetworkImage(
                  imageUrl: '${widget.productData['images'][currentIndex]}',
                  height: 370,
                  fit: BoxFit.cover,
                  key: ValueKey<int>(currentIndex),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10),
                          left: Radius.circular(10))),
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                                left: Radius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: '${widget.productData['images'][0]}',
                              width: 70,
                              height: 70,
                            )),
                        ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                                left: Radius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: '${widget.productData['images'][1]}',
                              width: 70,
                              height: 70,
                            )),
                        ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                                left: Radius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: '${widget.productData['images'][2]}',
                              width: 70,
                              height: 70,
                            )),
                        ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                                left: Radius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: '${widget.productData['images'][3]}',
                              width: 70,
                              height: 70,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ]),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.productData['genderStyle'] == 1
                          ? const Text('Nam')
                          : const Text('Nữ'),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(widget.productData['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    widget.productData['name'],
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Gap(20),
                  const Text('Chi tiết sản phẩm'),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: _isExpanded ? null : 60,
                        child: Text(
                          widget.productData['describe'],
                          overflow: TextOverflow.fade,
                          maxLines: 6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? 'Ẩn bớt' : 'Xem thêm',
                          style: const TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  const Gap(10),
                  const Text('Select Size'),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final size = sizes[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selectedSize == size
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: selectedSize == size
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(12);
                      },
                      itemCount: sizes.length,
                    ),
                  ),
                  const Gap(10),
                  const Text('Select Color:'),
                  const Gap(10),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final color = colors[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selectedColor == color
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                color,
                                style: TextStyle(
                                  color: selectedColor == color
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(12);
                      },
                      itemCount: colors.length,
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ]),
        ),
        Positioned(
          top: 0,
          right: 20,
          left: 20,
          child: Column(
            children: [
              const Gap(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Text(
                    'Chi tiết sản phẩm',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_bag),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCart(
                                userId: FirebaseAuth.instance.currentUser!.uid,
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
              const Gap(30),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        height: 105,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text('Giá sản phẩm'),
                    ],
                  ),
                  Text('\$${widget.productData['price'].toString()}'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (selectedSize == '' || selectedColor == '') {
                    context.showSnackBarInfo('Vui lòng chọn size và màu!');
                  } else {
                    int quantity = 1;
                    addToCartWithProductInfo(widget.userId, widget.productId,
                        quantity, selectedSize, selectedColor);
                    context.showSnackBarSuccess(
                      'Thêm vào giỏ hàng thành công!',
                    );
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                      left: Radius.circular(20),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                      Gap(10),
                      Text(
                        'Thêm vào giỏ hàng',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSize(String textSize) {
  return Container(
    width: 40,
    height: 40,
    decoration: const BoxDecoration(
      color: Colors.brown,
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(15),
        left: Radius.circular(15),
      ),
    ),
    child: Center(
        child: TextButton(
      onPressed: () {},
      child: Text(textSize),
    )),
  );
}

Widget buildRadio(bool value, Color color, Color color2) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        color: color2,
        borderRadius: const BorderRadius.all(Radius.circular(50))),
    child: Transform.scale(
      scale: 1.7,
      child: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        value: value,
        groupValue: false,
        onChanged: (value) {},
      ),
    ),
  );
}
