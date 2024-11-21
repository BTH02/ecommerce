import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/ui/06/homepage.dart';
import 'package:ecommerce/ui/07/wishlist.dart';
import 'package:ecommerce/ui/08/mycart.dart';
import 'package:ecommerce/ui/17/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../16/profile_setting.dart';

class BuildBottom extends StatefulWidget {
  const BuildBottom({super.key});

  @override
  State<BuildBottom> createState() => _BuildBottomState();
}

class _BuildBottomState extends State<BuildBottom> {
  int _currentIndex = 0; // chỉ mục của tab hiện tại

  // Các icon cho thanh điều hướng
  final iconList = <IconData>[
    Icons.home,
    Icons.favorite,
    Icons.message,
    Icons.person,
  ];

  final List<Widget> _screens = [
    const HomePage(),
    WishList(
      userId: FirebaseAuth.instance.currentUser!.uid,
    ),
    UserChatScreen(
      userId: FirebaseAuth.instance.currentUser!.uid,
    ),
    const ProfileSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCart(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                ),
              ));
        },
        child: const Icon(Icons.shopping_bag),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _currentIndex = index),
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        splashColor: Colors.blueAccent,
      ),
    );
  }
}
