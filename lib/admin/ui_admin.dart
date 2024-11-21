import 'package:ecommerce/admin/view_add_data.dart';
import 'package:ecommerce/admin/view_delete_data.dart';
import 'package:ecommerce/admin/view_update_data.dart';
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
      body: const Center(
        child: Text('Admin'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminUserListScreen(),)),
      ),
    );
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
