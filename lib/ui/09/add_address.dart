import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'api_address.dart';

class AddAddressScreen extends StatefulWidget {
  final String userId;

  const AddAddressScreen({super.key, required this.userId});

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _submitAddress() async {
    if (_formKey.currentState!.validate()) {
      await addAddress(
        userId: widget.userId,
        address: _addressController.text,

      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thêm địa chỉ thành công!')));
      Navigator.pop(context); // Đóng màn hình sau khi thêm địa chỉ
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thêm Địa Chỉ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                    labelText: "Địa chỉ chính", border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập địa chỉ chính";
                  }
                  return null;
                },
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: _submitAddress,
                child: const Text("Thêm Địa Chỉ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
