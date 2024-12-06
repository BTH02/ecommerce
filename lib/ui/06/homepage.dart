import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/06/product_sale.dart';
import 'package:ecommerce/ui/06/producthome.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Gap(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Vị trí cửa hàng'),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const Text('235,HQV,HN'),
                          IconButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, Routes.location),
                              icon: const Icon(Icons.keyboard_arrow_down))
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/notification.png'),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, Routes.search),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30))),
                          child: const Row(
                            children: [
                              Gap(10),
                              Icon(Icons.search),
                              Gap(5),
                              Text('Tìm kiếm')
                            ],
                          )),
                    ),
                  ),
                  const Gap(10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.filter),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset('images/filter.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(20),
              const BuildBanner(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Thể loại'),
                ],
              ),
              const Gap(10),
              const BuildCategory(),
              const Gap(10),
              const FlashSaleTime(),
              const Gap(10),
              const SizedBox(height: 250, child: ProductSale()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sản phẩm'),
                ],
              ),
              const Gap(10),
              const ProductHome(),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildBanner extends StatefulWidget {
  const BuildBanner({super.key});

  @override
  State<BuildBanner> createState() => _BuildBannerState();
}

class _BuildBannerState extends State<BuildBanner> {
  late PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Khởi tạo PageController
    _controller = PageController(initialPage: _currentPage);

    // Tự động chuyển trang mỗi 3 giây
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 4) {
        // Giả sử có 5 trang
        _currentPage++;
      } else {
        _currentPage = 0; // Quay lại trang đầu tiên khi hết trang
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hủy timer khi widget bị hủy
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('bannes')
            .doc('zHAgzmqoRI0Q7hy6ZWML')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Center(child: Text("Lỗi: ${snapshot.error}"));
            }
            final banner = snapshot.data!;
            return SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 170,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(20),
                          left: Radius.circular(20)),
                      child: PageView(
                        onPageChanged: (value) {
                          _currentPage = value;
                        },
                        controller: _controller,
                        children: [
                          CachedNetworkImage(
                            imageUrl: '${banner['images'][0]}',
                            fit: BoxFit.cover,
                          ),
                          CachedNetworkImage(
                              imageUrl: '${banner['images'][1]}',
                              fit: BoxFit.cover),
                          CachedNetworkImage(
                              imageUrl: '${banner['images'][2]}',
                              fit: BoxFit.cover),
                          CachedNetworkImage(
                              imageUrl: '${banner['images'][3]}',
                              fit: BoxFit.cover),
                          CachedNetworkImage(
                              imageUrl: '${banner['images'][4]}',
                              fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 5,
                    effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: Colors.brown,
                        dotColor: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        });
  }
}

class BuildCategory extends StatelessWidget {
  const BuildCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.tshirtCategory),
              child: _buildCategory('images/category/tshirt.png', 'Áo phông')),
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.pantCategory),
              child: _buildCategory('images/category/pant.png', 'Quần')),
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.dressCategory),
              child: _buildCategory('images/category/dress.png', 'Váy')),
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.jacketCategory),
              child: _buildCategory('images/category/jacket.png', 'Áo khoác')),
        ],
      ),
    );
  }
}

Widget _buildCategory(String nameIcon, String nameIcon1) {
  return Column(
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
              nameIcon,
              color: Colors.brown,
            ),
          ),
        ),
      ),
      const Gap(5),
      Text(nameIcon1)
    ],
  );
}

Widget _buildScroll(String text) {
  return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(20), left: Radius.circular(20))),
      child: Center(child: Text(text)));
}

class FlashSaleTime extends StatefulWidget {
  const FlashSaleTime({super.key});

  @override
  State<FlashSaleTime> createState() => _FlashSaleTimeState();
}

class _FlashSaleTimeState extends State<FlashSaleTime> {
  Timer? _timer;
  int _remainingTime =
      3 * 60 * 60; // Thời gian đếm ngược ban đầu: 3 giờ (10800 giây)

  @override
  void initState() {
    super.initState();
    startTimer(); // Bắt đầu đếm ngược khi khởi động ứng dụng
  }

  void startTimer() {
    _timer?.cancel(); // Hủy timer hiện tại nếu có

    // Tạo một Timer mới chạy mỗi giây
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    return '$hours';
  }

  String formatMinutes(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    return minutes.toString().padLeft(2, '0');
  }

  String formatSeconds(int seconds) {
    int secs = seconds % 60;
    return secs.toString().padLeft(2, '0');
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hủy timer khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Flash Sale'),
        Row(
          children: [
            const Text('Đóng trong:'),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5), left: Radius.circular(5))),
              child: Center(child: Text('0${formatTime(_remainingTime)}')),
            ),
            const Text(':'),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5), left: Radius.circular(5))),
              child: Center(child: Text(formatMinutes(_remainingTime))),
            ),
            const Text(':'),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5), left: Radius.circular(5))),
              child: Center(child: Text(formatSeconds(_remainingTime))),
            )
          ],
        )
      ],
    );
  }
}
