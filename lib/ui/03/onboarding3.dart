import 'package:flutter/material.dart';

class OnboardingThree extends StatefulWidget {
  const OnboardingThree({super.key});

  @override
  State<OnboardingThree> createState() => _OnboardingThreeState();
}

class _OnboardingThreeState extends State<OnboardingThree> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 430,
            width: 430,
          ),
          Column(
            children: [Text('Swift and Reliable'), Text('Experience')],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text('Lorem ipsum dolor sit amet, consectetur'),
              Text('adipicing elit, sed do eiusmod tempor incididunt')
            ],
          )
        ],
      ),
    );
  }
}
