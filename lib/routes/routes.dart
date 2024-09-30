
import 'package:ecommerce/ui/pages/createaccount.dart';
import 'package:ecommerce/ui/pages/profile.dart';
import 'package:ecommerce/ui/pages/sigin.dart';
import 'package:flutter/material.dart';

class Routes {
  const Routes._();

  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String createAccount = '/createAccount';
  static const String profile = '/profile';


  static Map<String, Widget Function(dynamic context)> routes = {
    signIn:(context) => const SignIn(),
    createAccount:(context) => const CreateAccount(),
    profile:(context) => const Profile()
  };
}
