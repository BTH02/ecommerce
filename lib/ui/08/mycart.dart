import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/06/api_mycart.dart';
import 'package:ecommerce/ui/09/checkout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:gap/gap.dart';

class MyCart extends StatefulWidget {
  const MyCart({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  Future<void> increaseQuantity(String itemId) async {
    DocumentReference itemRef = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId) // Dùng userId của người dùng
        .collection('cart')
        .doc(itemId);
    // Tăng số lượng
    await itemRef.update({
      'quantity': FieldValue.increment(1),
    });
  }

  // Hàm giảm số lượng
  Future<void> decreaseQuantity(String itemId) async {
    DocumentReference itemRef = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId) // Dùng userId của người dùng
        .collection('cart')
        .doc(itemId);
    // Kiểm tra nếu quantity > 1 thì mới giảm
    DocumentSnapshot snapshot = await itemRef.get();
    int currentQuantity = snapshot['quantity'];
    if (currentQuantity > 1) {
      await itemRef.update({
        'quantity': FieldValue.increment(-1),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = widget.userId;
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('cart')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Column(
                children: [
                  const Gap(60),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: IconButton(
                              onPressed: () => Navigator.pushNamed(context, Routes.buildbottom),
                              icon: const Icon(Icons.arrow_back)),
                        ),
                        const Gap(75),
                        const Text('Giỏ Hàng'),
                      ],
                    ),
                  ),
                  const Expanded(
                      child: Center(
                    child: Text('Giỏ hàng trống!'),
                  ))
                ],
              );
            }
            final cartItems = snapshot.data!.docs;
            // Tính tổng trường 'price'
            double total = 0;
            for (var item in cartItems) {
              total += (item['price'] * item['quantity'] ?? 0).toDouble();
            }
            double delivery = 30000;
            double totalAll = total + delivery;
            return Column(
              children: [
                const Gap(60),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: IconButton(
                            onPressed: () => Navigator.pushNamed(context, Routes.buildbottom),
                            icon: const Icon(Icons.arrow_back)),
                      ),
                      const Gap(75),
                      const Text('Giỏ hàng'),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final product = snapshot.data!.docs[index];
                            String itemId = product.id;
                            Map<String, dynamic> data =
                                product.data() as Map<String, dynamic>;
                            return Column(
                              children: [
                                SwipeActionCell(
                                    key: ValueKey(product),
                                    trailingActions: [
                                      SwipeAction(
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 50,
                                          color: Colors.red,
                                        ),
                                        color: Colors.black,
                                        onTap: (handler) {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return SizedBox(
                                                height: 230,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const Text(
                                                          'Xóa sản phẩm khỏi giỏ hàng?'),
                                                      const Gap(10),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 100,
                                                            height: 100,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .horizontal(
                                                                left: Radius
                                                                    .circular(
                                                                        20),
                                                                right: Radius
                                                                    .circular(
                                                                        20),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    '${data['img']}',
                                                              ),
                                                            ),
                                                          ),
                                                          const Gap(10),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(data[
                                                                    'productName']),
                                                                Text(
                                                                    'Size: ${data['size']}'),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(data[
                                                                            'price']
                                                                        .toString()),
                                                                    const Gap(
                                                                        70),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                          decoration: const BoxDecoration(
                                                                              color: Colors.black,
                                                                              borderRadius: BorderRadius.horizontal(right: Radius.circular(10), left: Radius.circular(10))),
                                                                          child:
                                                                              const Icon(
                                                                            Icons.remove,
                                                                            color:
                                                                                Colors.white,
                                                                            weight:
                                                                                5,
                                                                          ),
                                                                        ),
                                                                        const Gap(
                                                                            5),
                                                                        Text(data['quantity']
                                                                            .toString()),
                                                                        const Gap(
                                                                            5),
                                                                        Container(
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                          decoration: const BoxDecoration(
                                                                              color: Colors.black,
                                                                              borderRadius: BorderRadius.horizontal(right: Radius.circular(10), left: Radius.circular(10))),
                                                                          child:
                                                                              const Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                            weight:
                                                                                5,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const Gap(10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                              child: Container(
                                                                height: 40,
                                                                width: 80,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius: BorderRadius.horizontal(
                                                                      right: Radius
                                                                          .circular(
                                                                              20),
                                                                      left: Radius
                                                                          .circular(
                                                                              20)),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'Hủy',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Gap(15),
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                deleteCartItem(
                                                                    product.id);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 80,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .brown,
                                                                  borderRadius: BorderRadius.horizontal(
                                                                      right: Radius
                                                                          .circular(
                                                                              20),
                                                                      left: Radius
                                                                          .circular(
                                                                              20)),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'Đồng ý',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      left: Radius.circular(20),
                                                      right:
                                                          Radius.circular(20)),
                                              child: CachedNetworkImage(
                                                imageUrl: '${data['img']}',
                                              ),
                                            ),
                                          ),
                                          const Gap(10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(data['productName']),
                                                Text('Cỡ: ${data['size']}'),
                                                Text('Màu: ${data['color']}'),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(data['price']
                                                        .toString()),
                                                    const SizedBox(
                                                      width: 50,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius: BorderRadius.horizontal(
                                                                  right: Radius
                                                                      .circular(
                                                                          10),
                                                                  left: Radius
                                                                      .circular(
                                                                          10))),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                decreaseQuantity(
                                                                    itemId),
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white,
                                                              weight: 5,
                                                            ),
                                                          ),
                                                        ),
                                                        const Gap(5),
                                                        Text(data['quantity']
                                                            .toString()),
                                                        const Gap(5),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius: BorderRadius.horizontal(
                                                                  right: Radius
                                                                      .circular(
                                                                          10),
                                                                  left: Radius
                                                                      .circular(
                                                                          10))),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                increaseQuantity(
                                                                    itemId),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              weight: 5,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                const Divider(
                                  color: Colors.black,
                                  height: 0.01,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 255,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(25),
                                left: Radius.circular(25)),
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height: 45,
                                width: 100,
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Mã giảm giá',
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, top: 3, bottom: 3),
                                  height: 45,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(25),
                                          left: Radius.circular(25))),
                                  child: const Center(
                                      child: Text(
                                    'Đồng Ý',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Giá sản phẩm'),
                            Text('\$ ${total.toString()}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Giao hàng'),
                            Text('\$ ${delivery.toString()}'),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Giảm giá'),
                            Text('\$ 0'),
                          ],
                        ),
                        const Gap(10),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(15, (index) {
                              return Container(
                                width: 10,
                                height: 1,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 3),
                              );
                            }),
                          ),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tổng tiền'),
                            Text('\$ ${totalAll.toString()}'),
                          ],
                        ),
                        const Gap(10),
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 45,
                            decoration: const BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(25),
                                    left: Radius.circular(25))),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOut(
                                    userId: FirebaseAuth.instance.currentUser!.uid,
                                      selectedAddress: 'Chưa chọn địa chỉ'),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Tiến hành thanh toán',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
