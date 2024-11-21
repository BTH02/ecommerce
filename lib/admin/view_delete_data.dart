import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteProductByIdScreen extends StatefulWidget {
  const DeleteProductByIdScreen({super.key});

  @override
  State<DeleteProductByIdScreen> createState() =>
      _DeleteProductByIdScreenState();
}

class _DeleteProductByIdScreenState extends State<DeleteProductByIdScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _documentIdController = TextEditingController();

  Future<void> deleteProduct() async {
    if (_formKey.currentState!.validate()) {
      String documentId = _documentIdController.text;

      CollectionReference products =
          FirebaseFirestore.instance.collection('product');

      try {
        // Kiểm tra sự tồn tại của tài liệu trước khi xóa
        DocumentSnapshot docSnapshot = await products.doc(documentId).get();

        if (!docSnapshot.exists) {
          // Nếu tài liệu không tồn tại, hiển thị thông báo
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Không tìm thấy ID sản phẩm để xóa!")),
          );
          return;
        }

        // Nếu tài liệu tồn tại, xóa nó
        await products.doc(documentId).delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Xóa sản phẩm thành công!!")),
        );
        _documentIdController.clear(); // Xóa TextField sau khi xóa thành công
      } catch (e) {
        // Hiển thị SnackBar khi xóa thất bại (ví dụ: lỗi kết nối mạng)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Xóa thất bại: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xóa sản phẩm theo Document ID"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _documentIdController,
                decoration: const InputDecoration(
                  labelText: "Nhập Document ID của sản phẩm",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập ID sản phẩm';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: deleteProduct,
                child: const Text("Xóa sản phẩm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
