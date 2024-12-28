import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FirestoreUpdateDocumentExample extends StatelessWidget {
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _genderStyleController = TextEditingController();
  final TextEditingController _describeController = TextEditingController();
  final TextEditingController _imagesController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _categoryIdController = TextEditingController();

  FirestoreUpdateDocumentExample({super.key});

  // Hàm cập nhật trường tags vào document đã có sẵn
  Future<void> updateProductFields(
      String productId, Map<String, dynamic> fieldsToUpdate) async {
    DocumentReference productDoc =
        FirebaseFirestore.instance.collection('product').doc(productId);

    try {
      await productDoc.update(fieldsToUpdate);
      print('Selected fields updated successfully!');
    } catch (e) {
      print('Error updating selected fields: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sửa sản phẩm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _productIdController,
                decoration: const InputDecoration(
                  labelText: 'Nhập ID sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _sizeController,
                decoration: const InputDecoration(
                  labelText: 'Nhập các size của sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _imagesController,
                decoration: const InputDecoration(
                  labelText: 'Nhập các hình ảnh',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _categoryIdController,
                decoration: const InputDecoration(
                  labelText: 'Nhập thế loại sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _describeController,
                decoration: const InputDecoration(
                  labelText: 'Nhập chi tiết sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _ratingController,
                decoration: const InputDecoration(
                  labelText: 'Nhập đánh giá',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _genderStyleController,
                decoration: const InputDecoration(
                  labelText: 'Nhập kiểu (1 hoặc 2)',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nhập tên sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Nhập giá',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(10),
              TextField(
                controller: _colorController,
                decoration: const InputDecoration(
                  labelText: 'Nhập các màu sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  final String productId = _productIdController.text;
                  final Map<String, dynamic> fieldsToUpdate = {};
                  if (_nameController.text.isNotEmpty) {
                    fieldsToUpdate['name'] = _nameController.text;
                  }
                  if (_genderStyleController.text.isNotEmpty) {
                    fieldsToUpdate['genderStyle'] =
                        double.parse(_genderStyleController.text);
                  }
                  if (_ratingController.text.isNotEmpty) {
                    fieldsToUpdate['rating'] =
                        double.parse(_ratingController.text);
                  }
                  if (_priceController.text.isNotEmpty) {
                    fieldsToUpdate['price'] =
                        double.parse(_priceController.text);
                  }
                  if (_describeController.text.isNotEmpty) {
                    fieldsToUpdate['describe'] = _describeController.text;
                  }
                  if (_colorController.text.isNotEmpty) {
                    fieldsToUpdate['color'] = _colorController.text
                        .split(',')
                        .map((tag) => tag.trim())
                        .toList();
                  }
                  if (_imagesController.text.isNotEmpty) {
                    fieldsToUpdate['images'] = _imagesController.text
                        .split(',')
                        .map((tag) => tag.trim())
                        .toList();
                  }
                  if (_sizeController.text.isNotEmpty) {
                    fieldsToUpdate['size'] = _sizeController.text
                        .split(',')
                        .map((tag) => tag.trim())
                        .toList();
                  }

                  if (productId.isNotEmpty && fieldsToUpdate.isNotEmpty) {
                    updateProductFields(productId, fieldsToUpdate);
                    _productIdController.clear();
                    _nameController.clear();
                    _priceController.clear();
                    _ratingController.clear();
                    _genderStyleController.clear();
                    _imagesController.clear();
                    _categoryIdController.clear();
                    _describeController.clear();
                    context.showSnackBarInfo('Dữ liệu đã được cập nhật!');
                  } else {
                    context.showSnackBarInfo(
                        'Vui lòng nhập ID sản phẩm và ít nhất một trường để cập nhật!');
                  }
                },
                child: const Text("Sửa sản phẩm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
