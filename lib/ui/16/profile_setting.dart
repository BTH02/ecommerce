import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../04/auth_service.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    // Nếu không có người dùng đăng nhập, hiển thị thông báo lỗi
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('No user is logged in'),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Scaffold(
                body: Center(
                  child: Text('User data not found'),
                ),
              );
            }
            String fullName = snapshot.data!['fullName'];
            return Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  const Gap(60),
                  const Row(
                    children: [
                      Gap(110),
                      Text('Thông tin cá nhân'),
                    ],
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 120,
                    child: Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              child: Image.asset(
                                'images/avatame.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 1,
                            bottom: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  width: 35,
                                  height: 35,
                                  child: Image.asset(
                                    'images/penedit.png',
                                    scale: 5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(fullName),
                  const Gap(20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const _BuildProfile(
                          icon: Icons.person,
                          text: 'Phương thức thanh toán',
                        ),
                        _BuildProfile(
                          icon: Icons.person,
                          text: 'Đơn hàng',
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.myOrder),
                        ),
                        _BuildProfile(
                          icon: Icons.settings,
                          text: 'Cài đặt',
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.setting),
                        ),
                        const _BuildProfile(
                          icon: Icons.person,
                          text: 'Trung tâm hỗ trợ',
                        ),
                        const _BuildProfile(
                          icon: Icons.lock,
                          text: 'Chính sách bảo mật',
                        ),
                        const _BuildProfile(
                          icon: Icons.person,
                          text: 'Bạn bè',
                        ),
                        _BuildProfile(
                          icon: Icons.logout,
                          text: 'Đăng xuất',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 200,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text('Đăng xuất'),
                                        const Gap(20),
                                        const Text(
                                            'Bạn có muốn đăng xuât?'),
                                        const Gap(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    20),
                                                            left:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Hủy',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Gap(15),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  logOut(context);
                                                  signOutGg();
                                                  Navigator.pushNamed(
                                                      context, Routes.signIn);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.brown,
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    20),
                                                            left:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Đăng xuất',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          }),
    );
  }
}

class _BuildProfile extends StatelessWidget {
  const _BuildProfile({required this.icon, required this.text, this.onTap});

  final IconData icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Icon(
                        icon,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(text),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 0.01,
            )
          ],
        ),
      ),
    );
  }
}
