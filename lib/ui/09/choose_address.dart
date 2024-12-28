import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key, required this.userId});

  final String userId;

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  String? _selectedAddress;

  Future<void> _updateCartWithSelectedAddress(
    String userId,
    String address,
  ) async {
    final firestore = FirebaseFirestore.instance;

    try {
      // Tham chiếu đến subcollection `cart`
      final cartRef =
          firestore.collection('users').doc(userId).collection('cart');

      // Lấy document `address` từ `cart`
      final addressDoc = cartRef.doc('address');

      // Kiểm tra document có tồn tại không
      final docSnapshot = await addressDoc.get();

      if (docSnapshot.exists) {
        // Document đã tồn tại -> Ghi đè địa chỉ
        await addressDoc.update({'address': address});
      } else {
        // Document chưa tồn tại -> Thêm mới
        await addressDoc.set({'address': address});
      }

      print("Địa chỉ đã được cập nhật thành công!");
    } catch (e) {
      print("Lỗi khi cập nhật địa chỉ trong cart: $e");
      context.showSnackBarError("Lỗi: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text('Địa chỉ giao hàng'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.userId)
                        .collection('addresses')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const SizedBox(
                          height: 300,
                          child: Center(
                            child: Text('Chưa có địa chỉ!'),
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final product = snapshot.data!.docs[index];
                          Map<String, dynamic> data = product.data();
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      Text(
                                        data['address'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Radio<String>(
                                      value: data['address'],
                                      groupValue: _selectedAddress,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedAddress = value;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                height: 0.01,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              DottedBorder(
                dashPattern: const [6, 3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.addAddress),
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(15),
                            right: Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        '+ Thêm địa chỉ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: GestureDetector(
          onTap: () async {
            if (_selectedAddress != null) {
              await _updateCartWithSelectedAddress(
                  FirebaseAuth.instance.currentUser!.uid, _selectedAddress!);
              Navigator.pop(context, _selectedAddress);
            } else {
              context.showSnackBarInfo("Vui lòng chọn một địa chỉ!");
            }
          },
          child: Center(
            child: Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              child: const Center(
                  child: Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
