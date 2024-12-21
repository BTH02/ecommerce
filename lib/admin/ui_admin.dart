import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/admin/view_add_data.dart';
import 'package:ecommerce/admin/view_delete_data.dart';
import 'package:ecommerce/admin/view_update_data.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/04/auth_service.dart';
import '../ui/17/user_list_chat.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giao diện Admin'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text(
                    "Admin",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text("admin@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/avatame.png")),
                )),
            listTile(Icons.home, "Trang chủ", () {}),
            listTile(CupertinoIcons.person, "Sản phẩm", () {}),
            listTile(CupertinoIcons.person, "Sửa sản phẩm", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirestoreUpdateDocumentExample(),
                  ));
            }),
            listTile(CupertinoIcons.person, "Thêm sản phẩm", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductScreen(),
                  ));
            }),
            listTile(CupertinoIcons.person, "Xóa sản phẩm", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeleteProductByIdScreen(),
                  ));
            }),
            listTile(Icons.exit_to_app_outlined, "Đăng xuất", () {
              logOut(context);
            }),
          ],
        ),
      ),
      body: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Lỗi khi tải đơn hàng"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Không có đơn hàng nào."));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, orderIndex) {
              final order = orders[orderIndex];
              final orderId = order.id;
              final orderData = order.data() as Map<String, dynamic>;
              final products = orderData['products'] as List<dynamic>;
              final address = orderData['address'];
              final userName = orderData['userName']; // Địa chỉ giao hàng
              final status = orderData['status']; // Trạng thái đơn hàng
              final createdAt =
                  (orderData['createdAt'] as Timestamp?)?.toDate();
              final filteredProducts = products.where((product) {
                return product['productId'] != 'address';
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
                        Text(
                          'Đơn hàng ${orderIndex + 1}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text('Trạng thái: $status'),
                        Text('Ngày tạo: ${createdAt?.toLocal()}'),
                        const SizedBox(height: 10),
                        Text('Tên người đặt: $userName'),
                        const SizedBox(height: 10),
                        Text('Địa chỉ: $address'),
                        const SizedBox(height: 10),
                        const Text('Sản phẩm:'),
                        const SizedBox(height: 5),
                        // Hiển thị tất cả sản phẩm, không lọc gì cả
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
                                          imageUrl: product['img'],
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
                                          product['productName'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Size: ${product['size']}'),
                                        Text('Màu sắc: ${product['color']}'),
                                        Row(
                                          children: [
                                            Text('Giá: ${product['price']}'),
                                            const SizedBox(width: 20),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _updateOrderStatus(
                                      orderId, 'cancelled', context);
                                },
                                child: const Text(
                                  'Hủy đơn',
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                                onPressed: () {
                                  _updateOrderStatus(
                                      orderId, 'success', context);
                                },
                                child: const Text(
                                  'Đã giao hàng thành công',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      )),
      bottomNavigationBar: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Colors.red,
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Đang tải doanh thu...',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          }

          final orders = snapshot.data!.docs;
          double totalRevenue = 0.0;

          for (final order in orders) {
            final orderData = order.data() as Map<String, dynamic>;
            if (orderData['status'] == 'success') {
              final products = orderData['products'] as List<dynamic>;
              for (final product in products) {
                final price = product['price'];
                if (price != null && price is num) {
                  totalRevenue += price.toDouble();
                }
              }
            }
          }

          return Container(
            color: Colors.green,
            height: 80,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tổng doanh thu:',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalRevenue.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminUserListScreen(),
            )),
      ),
    );
  }
}

void _updateOrderStatus(
    String orderId, String newStatus, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
      'status': newStatus,
    });
    context.showSnackBarSuccess("Xóa sản phẩm thành công!!");
  } catch (e) {
    context.showSnackBarError("Có lỗi xảy ra: $e");
  }
}

ListTile listTile(IconData iconData, String name, Function()? onTap) {
  return ListTile(
    leading: Icon(
      iconData,
      color: Colors.red,
    ),
    title: Text(
      name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    onTap: onTap,
  );
}
