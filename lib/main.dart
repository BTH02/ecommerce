
import 'package:ecommerce/ui/03/onboarding.dart';
import 'package:ecommerce/ui/03/onboarding1.dart';
import 'package:ecommerce/ui/pages/profile.dart';
import 'package:ecommerce/ui/pages/sigin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
