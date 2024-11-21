import 'package:ecommerce/ui/04/sigin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No user is currently signed in"),
      ));
      return;
    }

    try {
      // Xác thực lại người dùng nếu đã đăng nhập lâu
      await _reauthenticate(user);

      // Xóa tài khoản người dùng
      await user.delete();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Xóa tài khoản thành công!"),
      ));

      // Sau khi xóa, chuyển hướng người dùng về màn hình đăng nhập hoặc trang khác
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Không thể xóa tài khoản: $e"),
      ));
    }
  }

  Future<void> _reauthenticate(User user) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: _passwordController.text,
      );

      // Yêu cầu xác thực lại với mật khẩu hiện tại
      await user.reauthenticateWithCredential(credential);
    } catch (e) {
      throw "Mật khẩu không chính xác.Vui lòng thử lại";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xóa tài khoản")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: "Nhập mật khẩu", border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? "Nhập mật khẩu hiện tại"
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _deleteAccount();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Nút xóa tài khoản có màu đỏ
                ),
                child: const Text("Xóa tài khoản"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
