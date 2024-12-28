import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:ecommerce/ui/08/my_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({
    super.key,
    required this.userId,
    required this.totalPrice,
  });

  final String userId;
  final double totalPrice;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool _isSelectedAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            const _AppBar(),
            const Gap(20),
            const Text('Địa chỉ giao hàng'),
            const Gap(10),
            _DeliveryAddress(() => _isSelectedAddress = true),
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
            const _TypeDelivery(),
            const Gap(20),
            const Divider(
              color: Colors.black,
              height: 0.01,
            ),
            const Gap(30),
            const Text('Danh sách đơn hàng'),
            _ListOrder(widget.userId),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Center(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (_isSelectedAddress) {
                Navigator.pushNamed(
                  context,
                  Routes.payment,
                  arguments: widget.totalPrice,
                );
              } else {
                context.showSnackBarInfo("Chưa chọn địa chỉ giao hàng");
              }
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
              ),
              child: const Center(
                child: Text(
                  'Tiếp tục thanh toán',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCart(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                ),
              ),
            ),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        const Text('Kiểm tra lại'),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.buildbottom),
            icon: const Icon(Icons.home_outlined),
          ),
        )
      ],
    );
  }
}

class _DeliveryAddress extends StatefulWidget {
  const _DeliveryAddress(this.onSelectedAddress);

  final VoidCallback onSelectedAddress;

  @override
  State<_DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<_DeliveryAddress> {
  String _address = "Chưa chọn địa chỉ";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on),
            Text(
              _address,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(20),
              left: Radius.circular(20),
            ),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.shippingAddress).then(
                (value) {
                  if (value is String) {
                    setState(() {
                      _address = value;
                    });

                    widget.onSelectedAddress.call();
                  }
                },
              );
            },
            child: const Center(
              child: Text('Thay đổi'),
            ),
          ),
        )
      ],
    );
  }
}

class _TypeDelivery extends StatelessWidget {
  const _TypeDelivery();

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(20), left: Radius.circular(20)),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.chooseship),
            child: const Center(
              child: Text('Thay đổi'),
            ),
          ),
        ),
      ],
    );
  }
}

class _ListOrder extends StatelessWidget {
  const _ListOrder(this.userId);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
            return const SizedBox(
              height: 300,
              child: Center(
                child: Text('Đơn hàng trống!'),
              ),
            );
          }
          final filteredDocs = snapshot.data!.docs.where((doc) {
            return doc.id != 'address' &&
                doc.id != 'userName'; // Loại bỏ document có id là "address"
          }).toList();
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredDocs.length,
            itemBuilder: (context, index) {
              final product = filteredDocs[index];
              Map<String, dynamic> data =
                  product.data() as Map<String, dynamic>;
              return Column(
                children: [
                  const Gap(12),
                  Row(
                    children: [
                      SizedBox(
                        width: 110,
                        height: 110,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(20),
                            right: Radius.circular(20),
                          ),
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
                            ),
                          ),
                          Text('Size: ${data['size']}'),
                          Text('Màu: ${data['color']}'),
                          Text('Số lượng:${data['quantity'].toString()}'),
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
                  const Gap(12),
                  const Divider(
                    color: Colors.black,
                    height: 0.01,
                  ),
                ],
              );
            },
          );
        });
  }
}
