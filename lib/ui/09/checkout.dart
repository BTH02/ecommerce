import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/08/mycart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatefulWidget {
  const CheckOut(
      {super.key, required this.selectedAddress, required this.userId});

  final String selectedAddress;
  final String userId;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late String _address;

  @override
  void initState() {
    super.initState();
    // Gán giá trị từ widget vào các biến của State
    _address = widget.selectedAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyCart(
                                      userId: FirebaseAuth
                                          .instance.currentUser!.uid),
                                )),
                            icon: const Icon(Icons.arrow_back)),
                      ),
                      const Text('Kiểm tra lại'),
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, Routes.buildbottom),
                              icon: const Icon(Icons.home_outlined)))
                    ],
                  ),
                  const Gap(20),
                  const Text('Địa chỉ giao hàng'),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(
                            _address,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20)),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.ship),
                            child: const Center(child: Text('Thay đổi'))),
                      )
                    ],
                  ),
                  const Gap(20),
                  const Divider(
                    color: Colors.black,
                    height: 0.01,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Chọn kiểu giao hàng'),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset('images/shipbox.png')),
                          const Gap(5),
                          const Text(
                            'Economy',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20)),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.chooseship),
                            child: const Center(child: Text('Thay đổi'))),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Divider(
                    color: Colors.black,
                    height: 0.01,
                  ),
                  const Gap(30),
                  const Text('Danh sách đơn hàng'),
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.userId)
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
                    return const SizedBox(
                      height: 300,
                      child: Center(
                        child: Text('Đơn hàng trống!'),
                      ),
                    );
                  }
                  final filteredDocs = snapshot.data!.docs.where((doc) {
                    return doc.id != 'address' &&
                        doc.id !=
                            'userName'; // Loại bỏ document có id là "address"
                  }).toList();
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredDocs.length,
                    itemBuilder: (context, index) {
                      final product = filteredDocs[index];
                      Map<String, dynamic> data =
                          product.data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(20),
                                        right: Radius.circular(20)),
                                    child: CachedNetworkImage(
                                      imageUrl: '${data['img']}',
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 200,
                                        child: Text(
                                          data['productName'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Text('Size: ${data['size']}'),
                                    Text('Màu: ${data['color']}'),
                                    Text(
                                        'Số lượng:${data['quantity'].toString()}'),
                                    Row(
                                      children: [
                                        Text(data['price'].toString()),
                                        const Gap(70),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 0.01,
                            endIndent: 20,
                            indent: 20,
                          ),
                        ],
                      );
                    },
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.payment),
            child: Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              child: const Center(
                  child: Text(
                'Tiếp tục thanh toán',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
