import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Center(
            child: Text(
              'Đăng kí tài khoản',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Text('Điền thông tin của bạn bên dưới hoặc đăng ký'),
              Text('với tài khoản xã hội của bạn')
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('Họ và tên'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      hintText: 'Họ và tên',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30))),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "Nhập họ và tên của bạn"
                        : null,
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text('Email'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30))),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nhập email của bạn"; // Thông báo nếu email trống
                          }
                          // Kiểm tra email có chứa "@gmail.com"
                          if (!value.contains('@gmail.com')) {
                            return "Email phải có @gmail.com "; // Thông báo nếu không phải @gmail.com
                          }
                          return null; // Nếu email hợp lệ
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text('Mật khẩu'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !isPasswordVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          hintText: '**********',
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30))),
                        ),
                        validator: (value) => value != null && value.length >= 6
                            ? null
                            : "Mật khẩu ít nhất 6 kí tự",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                activeColor: Colors.brown,
                onChanged: (value) {},
              ),
              const Text('Đồng ý với'),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Điều khoản & Điều kiện',
                style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red),
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              String email = emailController.text;
              String password = passwordController.text;
              String fullName = fullNameController.text;
              User? user =
                  await AuthService().signUpUser(email, password, fullName);
              if (_formKey.currentState!.validate()) {
                if (user != null) {
                  context.showSnackBarSuccess('Tạo tài khoản thành công!');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Bạn có muốn đăng nhập ngay!'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Hủy')),
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, Routes.signIn),
                                child: const Text('Đồng ý'),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                } else {
                  context.showSnackBarInfo("Không thể tạo tài khoản");
                }
              }
            },
            child: Container(
              width: 330,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30), left: Radius.circular(30))),
              child: const Center(
                child: Text(
                  'Đăng kí',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  height: 1,
                  width: 100,
                  color: Colors.black,
                ),
                const Text('Đăng nhập với'),
                Container(
                  margin: const EdgeInsets.only(right: 30),
                  height: 1,
                  width: 100,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/apple.png',
                      height: 40,
                      width: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/google.png',
                      height: 40,
                      width: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/facebook.png',
                      height: 40,
                      width: 40,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bạn đã có tài khoản?"),
              TextButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.signIn),
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red),
                  ))
            ],
          ),
        ],
      )),
    );
  }
}
