import 'package:ecommerce/admin/ui_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';
import 'auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        return user;
      }
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Gap(100),
                    const Center(
                      child: Text('Đăng nhập',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    const Gap(10),
                    const Center(
                      child: Text(
                          'Chào bạn! Chào mừng đến với ứng dụng của chúng tôi'),
                    ),
                    const Gap(50),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text('Email'),
                            ],
                          ),
                          const Gap(10),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'example@gmail.com',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(30),
                                      right: Radius.circular(30))),
                            ),
                            validator: (value) => value == null || value.isEmpty
                                ? "Nhập email của bạn"
                                : null,
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text('Mật khẩu'),
                            ],
                          ),
                          const Gap(10),
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
                            validator: (value) =>
                                value != null && value.length >= 6
                                    ? null
                                    : "Mật khẩu ít nhất 6 kí tự",
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, Routes.forgotPassword),
                            child: const Text(
                              'Quên mật khẩu?',
                              style: TextStyle(
                                  color: Colors.brown,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.brown),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Gap(35),
                    GestureDetector(
                      onTap: () async {
                        String email = emailController.text;
                        String password = passwordController.text;

                        User? user =
                            await AuthService().signInUser(email, password);
                        if (_formKey.currentState!.validate()) {
                          if (user == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Sai email hoặc mật khẩu!')),
                            );
                          }
                          if (user != null) {
                            bool isAdminUser = await isAdmin(user);
                            if (isAdminUser) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AdminView(),
                                  ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Đăng nhập admin thành công!')),
                              );
                            } else {
                              Navigator.pushNamed(context, Routes.buildbottom);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Đăng nhập thành công!')),
                              );
                            }
                          }
                        }
                      },
                      child: Container(
                        width: 330,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(30),
                                left: Radius.circular(30))),
                        child: const Center(
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const Gap(40),
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
                      height: 40,
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
                              onPressed: () async {
                                User? user = await signInWithGoogle();
                                if (user != null) {
                                  Navigator.pushNamed(
                                      context, Routes.buildbottom);
                                } else {
                                  print('Đăng nhập không thành công');
                                }
                              },
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
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Bạn chưa có tài khoản?"),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, Routes.createAccount),
                            child: const Text(
                              'Đăng kí',
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.red),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
