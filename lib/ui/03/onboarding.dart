import 'package:ecommerce/ui/03/onboarding1.dart';
import 'package:ecommerce/ui/03/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [OnboardingOne(), OnboardingTwo()],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.brown,
                dotColor: Colors.grey),
          ),
          SizedBox(height: 60,)
        ],
      ),
    );
  }
}
