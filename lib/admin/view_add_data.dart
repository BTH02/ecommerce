import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  // Tạo các TextEditingController để lấy dữ liệu từ TextField
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _categoryIdController = TextEditingController();

  final TextEditingController _colorController = TextEditingController();

  final TextEditingController _describeController = TextEditingController();

  final TextEditingController _genderStyleController = TextEditingController();

  final TextEditingController _imagesController = TextEditingController();

  final TextEditingController _nameLowerController = TextEditingController();

  final TextEditingController _ratingController = TextEditingController();

  final TextEditingController _sizeController = TextEditingController();

  // Hàm để thêm sản phẩm vào Firestore
  Future<void> addProduct() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String describe = _describeController.text;
      double rating = double.parse(_ratingController.text);
      double genderStyle = double.parse(_genderStyleController.text);
      String nameLower = _nameLowerController.text;
      double price = double.parse(_priceController.text);
      String categoryId = _categoryIdController.text;
      List<String> color =
          _colorController.text.split(',').map((tag) => tag.trim()).toList();
      List<String> images =
          _imagesController.text.split(',').map((tag) => tag.trim()).toList();
      List<String> size =
          _sizeController.text.split(',').map((tag) => tag.trim()).toList();

      CollectionReference products =
          FirebaseFirestore.instance.collection('product');

      try {
        await products.add({
          'name': name,
          'describe': describe,
          'price': price,
          'color': color,
          'images': images,
          'size': size,
          'name_lower': nameLower,
          'categoryId': categoryId,
          'rating': rating,
          'genderStyle': genderStyle,
        });
        print("Product added successfully!");

        // Sau khi thêm xong, có thể dọn sạch các TextField
        _nameController.clear();
        _describeController.clear();
        _priceController.clear();
        _colorController.clear();
        _categoryIdController.clear();
        _ratingController.clear();
        _nameLowerController.clear();
        _sizeController.clear();
        _genderStyleController.clear();
        _imagesController.clear();
      } catch (e) {
        print("Failed to add product: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thêm sản phẩm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Tên sản phẩm", border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên sản phẩm';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                TextFormField(
                  controller: _nameLowerController,
                  decoration: const InputDecoration(
                      labelText: "Tên lower của sản phẩm",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên lower sản phẩm';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                TextFormField(
                  controller: _describeController,
                  decoration: const InputDecoration(
                      labelText: "Tên chi tiết của sản phẩm",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập chi tiết sản phẩm';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                      labelText: "Giá sản phẩm", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập giá sản phẩm';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const Gap(10),
                TextFormField(
                  controller: _ratingController,
                  decoration: const InputDecoration(
                      labelText: "Nhập đánh giá", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập đánh giá';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const Gap(10),
                TextFormField(
                  controller: _genderStyleController,
                  decoration: const InputDecoration(
                      labelText: "Nhập kiểu (1 hoặc 2)",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập kiểu sản phẩm';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const Gap(10),
                TextFormField(
                  controller: _imagesController,
                  decoration: const InputDecoration(
                      labelText: "Nhập hình ảnh(4 hình)",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập hình ảnh sản phẩm';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                TextFormField(
                  controller: _colorController,
                  decoration: const InputDecoration(
                      labelText: "Nhập color(5 màu)",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập color sản phẩm';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                TextFormField(
                  controller: _sizeController,
                  decoration: const InputDecoration(
                      labelText: "Nhập size (6size)",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập size sản phẩm';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                TextFormField(
                  controller: _categoryIdController,
                  decoration: const InputDecoration(
                      labelText: "Nhập thể loại", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập thể loại sản phẩm';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    addProduct();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                          Text('Thêm sản phẩm thành công!')),
                    );
                  },
                  child: const Text("Thêm sản phẩm"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
