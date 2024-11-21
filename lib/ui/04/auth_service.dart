import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/ui/04/sigin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Hàm đăng ký người dùng mới
  Future<User?> signUpUser(
      String email, String password, String fullName) async {
    try {
      // Đăng ký người dùng với email và mật khẩu
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Lấy thông tin người dùng
      User? user = userCredential.user;

      // Nếu người dùng không null, tạo tài liệu người dùng trong Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'role': 'user',
          'email': user.email,
          'fullName': fullName,
          'createdAt': Timestamp.now(),
        });
      }

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> signInUser(String email, String password) async {
    try {
      // Đăng nhập người dùng với email và mật khẩu
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      return null;
    }
  }
}

Future<bool> isAdmin(User user) async {
  try {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      String role = userDoc['role'];
      return role == 'admin';
    } else {
      return false;
    }
  } catch (e) {
    print("Error: $e");
    return false;
  }
}
Future<void> logOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut(); // Đăng xuất người dùng
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đăng xuất thành công')),
    );

    // Sau khi đăng xuất, bạn có thể chuyển người dùng về màn hình đăng nhập
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đăng xuất không thành công')),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> signOutGg() async {
  await googleSignIn.signOut();
  await _auth.signOut();
}