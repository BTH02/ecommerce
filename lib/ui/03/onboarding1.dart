import 'package:flutter/material.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Container(
          margin: const EdgeInsets.only(right: 20),
            child: const Text('Skip'))],
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 430,
            width: 430,
          ),
          Column(
            children: [Text('Seamless Shopping'), Text('Experience')],
          ),
          SizedBox(height: 20,),
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
