import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/03/onboarding1.dart';
import 'package:ecommerce/ui/03/onboarding2.dart';
import 'package:ecommerce/ui/03/onboarding3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      // Giới hạn số trang
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [OnboardingOne(), OnboardingTwo(),OnboardingThree()],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.brown,width: 1)
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back,color: Colors.brown,),
                        onPressed: _previousPage,
                      ),
                    ),
                  // Chỉ hiển thị icon arrow_right ở trang thứ 2 trở đi
                  if (_currentPage == 0 )
                    Container(
                      margin: const EdgeInsets.only(left: 300),
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                        onPressed: _nextPage,
                      ),
                    ),
                  if (_currentPage == 1 )
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                        onPressed: _nextPage,
                      ),
                    ),
                  if(_currentPage == 2)
                    Container(
                      margin: const EdgeInsets.only(left: 20,right: 20),
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                        onPressed: () => Navigator.pushNamed(context, Routes.signIn),
                      ),
                    ),
                ],
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Colors.brown,
                      dotColor: Colors.grey),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
