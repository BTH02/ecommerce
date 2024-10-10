import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/06/homepage.dart';
import 'package:ecommerce/ui/07/wishlist.dart';
import 'package:ecommerce/ui/13/myorder.dart';
import 'package:ecommerce/ui/pages/profile.dart';
import 'package:flutter/material.dart';

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
    const WishList(),
    const MyOrder(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.myCart);
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
