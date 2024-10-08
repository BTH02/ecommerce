import 'package:ecommerce/ui/03/onboarding.dart';
import 'package:ecommerce/ui/06/bottomnavigation.dart';
import 'package:ecommerce/ui/06/homepage.dart';
import 'package:ecommerce/ui/06/productdetail.dart';
import 'package:ecommerce/ui/07/wishlist.dart';
import 'package:ecommerce/ui/08/mycart.dart';
import 'package:ecommerce/ui/09/ship.dart';
import 'package:ecommerce/ui/modal/product.dart';
import 'package:ecommerce/ui/pages/createaccount.dart';
import 'package:ecommerce/ui/pages/profile.dart';
import 'package:ecommerce/ui/pages/sigin.dart';
import 'package:ecommerce/ui/pages/verifycode.dart';
import 'package:flutter/material.dart';

import '../ui/09/checkout.dart';

class Routes {
  const Routes._();

  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String createAccount = '/createAccount';
  static const String profile = '/profile';
  static const String verycode = '/verycode';
  static const String buildbottom = '/buildbottom';
  static const String wishList = '/wishList';
  static const String myCart = '/myCart';
  static const String productDetail = '/productDetail';
  static const String onboard = '/onboard';
  static const String checkout = '/checkout';
  static const String ship = '/ship';

  static Map<String, Widget Function(dynamic context)> routes = {
    home: (context) => const HomePage(),
    signIn: (context) => const SignIn(),
    onboard:(context) => const Onboarding(),
    createAccount: (context) => const CreateAccount(),
    profile: (context) => const Profile(),
    verycode: (context) => const VerifyCode(),
    buildbottom: (context) => const BuildBottom(),
    wishList:(context) => const WishList(),
    myCart:(context) => const MyCart(),
    productDetail:(context) {
      final arg = (ModalRoute.of(context)?.settings.arguments ?? Product.pure()) as Product;
      return ProductDetail(productItem: arg);
    },
    checkout:(context) => const CheckOut(),
    ship:(context) => const ShippingAddress(),
  };
}
