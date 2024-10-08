import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class OnboardingTwo extends StatefulWidget {
  const OnboardingTwo({super.key});

  @override
  State<OnboardingTwo> createState() => _OnboardingTwoState();
}

class _OnboardingTwoState extends State<OnboardingTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () => Navigator.pushNamed(context, Routes.signIn),
              ))
        ],
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
