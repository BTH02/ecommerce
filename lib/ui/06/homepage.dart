import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/06/producthome.dart';
import 'package:ecommerce/ui/modal/product.dart';
import 'package:flutter/material.dart';
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
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location'),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text('New York, USA'),
                          Icon(Icons.keyboard_arrow_down)
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30))),
                      child: const TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, Routes.filter),
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
              const SizedBox(
                height: 20,
              ),
              BuildBanner(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Category'), Text('See All')],
              ),
              const SizedBox(
                height: 10,
              ),
              const BuildCategory(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Flash Sale'),
                  Row(
                    children: [
                      const Text('Closing in:'),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(5),
                                left: Radius.circular(5))),
                        child: const Center(child: Text('02')),
                      ),
                      const Text(':'),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(5),
                                left: Radius.circular(5))),
                        child: const Center(child: Text('12')),
                      ),
                      const Text(':'),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(5),
                                left: Radius.circular(5))),
                        child: const Center(child: Text('56')),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildScroll('All'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Newest'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Popular'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Man'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Women'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ProductHome(
                product: Product.pure(),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildBanner extends StatelessWidget {
  BuildBanner({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 170,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(20), left: Radius.circular(20)),
              child: PageView(
                controller: _controller,
                children: [
                  Image.asset(
                    'images/banner/banner1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/banner/banner2.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/banner/banner3.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/banner/banner4.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/banner/banner5.png',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
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
          _buildCategory('images/category/tshirt.png', 'T-Shirt'),
          _buildCategory('images/category/pant.png', 'Pant'),
          _buildCategory('images/category/dress.png', 'Dress'),
          _buildCategory('images/category/jacket.png', 'Jacket'),
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
      const SizedBox(
        height: 5,
      ),
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
