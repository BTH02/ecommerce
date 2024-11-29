import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Active extends StatefulWidget {
  const Active({super.key, required this.userId});

  final String userId;

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('userId', isEqualTo: widget.userId) // Lọc theo userId
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Lỗi khi tải đơn hàng"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Bạn chưa có đơn hàng nào."));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, orderIndex) {
              final order = orders[orderIndex];
              final orderData = order.data() as Map<String, dynamic>;
              final products = orderData['products'] as List<dynamic>;
              final filteredProducts = products.where((product) {
                return product['productId'] != 'address' && product['productId'] != 'userName';
              }).toList();
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sản phẩm:'),
                        const SizedBox(height: 5),
                        // Lặp qua các sản phẩm trong đơn hàng
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: List.generate(filteredProducts.length,
                                (productIndex) {
                              final product = filteredProducts[productIndex];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                left: Radius.circular(20),
                                                right: Radius.circular(20)),
                                        child: CachedNetworkImage(
                                          imageUrl: '${product['img']}',
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${product['productName']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Size: ${product['size']}'),
                                        Text('Màu sắc: ${product['color']}'),
                                        Row(
                                          children: [
                                            Text('Giá: ${product['price']}'),
                                            const SizedBox(width: 20),
                                            GestureDetector(
                                              onTap: () {
                                                // Xử lý theo dõi đơn hàng
                                              },
                                              child: Container(
                                                width: 90,
                                                height: 35,
                                                decoration: const BoxDecoration(
                                                  color: Colors.brown,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                    right: Radius.circular(20),
                                                    left: Radius.circular(20),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Theo dõi',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
