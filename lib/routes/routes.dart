import 'package:ecommerce/ui/03/onboarding.dart';
import 'package:ecommerce/ui/04/forgot_password.dart';
import 'package:ecommerce/ui/05/location.dart';
import 'package:ecommerce/ui/06/bottomnavigation.dart';
import 'package:ecommerce/ui/06/homepage.dart';
import 'package:ecommerce/ui/09/add_address.dart';
import 'package:ecommerce/ui/09/choose_address.dart';
import 'package:ecommerce/ui/09/choose_ship.dart';
import 'package:ecommerce/ui/09/payment.dart';
import 'package:ecommerce/ui/09/payment_success.dart';
import 'package:ecommerce/ui/11/search.dart';
import 'package:ecommerce/ui/12/filter.dart';
import 'package:ecommerce/ui/13/my_order.dart';
import 'package:ecommerce/ui/13/review/leave_review.dart';
import 'package:ecommerce/ui/13/review/track_review.dart';
import 'package:ecommerce/ui/15/dress_category.dart';
import 'package:ecommerce/ui/15/jacket_category.dart';
import 'package:ecommerce/ui/15/pant_category.dart';
import 'package:ecommerce/ui/15/tshirt_category.dart';
import 'package:ecommerce/ui/16/managerpass/manager_dele.dart';
import 'package:ecommerce/ui/16/managerpass/manager_password.dart';
import 'package:ecommerce/ui/16/setting_setting.dart';
import 'package:ecommerce/ui/modal/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/04/create_account.dart';
import '../ui/04/profile.dart';
import '../ui/04/sigin.dart';

class Routes {
  const Routes._();

  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String createAccount = '/createAccount';
  static const String profile = '/profile';
  static const String buildbottom = '/buildbottom';
  static const String wishList = '/wishList';
  static const String onboard = '/onboard';
  static const String shippingAddress = '/shipping-address';
  static const String chooseship = '/chooseship';
  static const String payment = '/payment';
  static const String paymentSuccess = '/paymentSuccess';
  static const String location = '/location';
  static const String yourlocation = '/yourlocation';
  static const String filter = '/filter';
  static const String myOrder = '/myOrder';
  static const String leaveReview = '/leaveReview';
  static const String trackReview = '/trackReview';
  static const String setting = '/setting';
  static const String search = '/search';
  static const String searchItem = '/searchItem';
  static const String settingPass = '/settingPass';
  static const String jacketCategory = '/jacketCategory';
  static const String dressCategory = '/dressCategory';
  static const String pantCategory = '/pantCategory';
  static const String tshirtCategory = '/tshirtCategory';
  static const String deleteAccount = '/deleteAccount';
  static const String forgotPassword = '/forgotPassword';
  static const String addAddress = '/addAddress';

  static Map<String, Widget Function(dynamic context)> routes = {
    home: (context) => const HomePage(),
    signIn: (context) => const SignIn(),
    onboard: (context) => const Onboarding(),
    createAccount: (context) => const CreateAccount(),
    profile: (context) => const Profile(),
    buildbottom: (context) => const BuildBottom(),
    location: (context) => const StoreMap(),
    // wishList: (context) => const WishList(userId: FirebaseAuth.instance.currentUser!.uid,),
    shippingAddress: (context) => ShippingAddress(
          userId: FirebaseAuth.instance.currentUser!.uid,
        ),
    chooseship: (context) => const ChooseShip(),
    payment: (context) {
      final args = (ModalRoute.of(context)?.settings.arguments ?? 0) as double;

      return Payment(totalPrice: args);
    },
    paymentSuccess: (context) => const PaymentSuccess(),
    filter: (context) => const Filter(),
    myOrder: (context) => const MyOrder(),
    leaveReview: (context) {
      final arg = (ModalRoute.of(context)?.settings.arguments ?? Product.pure())
          as Product;
      return LeaveReview(productReview: arg);
    },
    trackReview: (context) {
      final arg = (ModalRoute.of(context)?.settings.arguments ?? Product.pure())
          as Product;
      return TrackOrder(productTrack: arg);
    },
    setting: (context) => const Settings(),
    search: (context) => const Search(),
    settingPass: (context) => const SettingPassword(),
    dressCategory: (context) => const DressCategory(
          categoryId: 'category-dress',
        ),
    pantCategory: (context) => const PantCategory(
          categoryId: 'category-pant',
        ),
    tshirtCategory: (context) => const TShirtCategory(
          categoryId: 'category-t-shirt',
        ),
    jacketCategory: (context) => const JacketCategory(
          categoryId: 'category-jacket',
        ),
    deleteAccount: (context) => const DeleteAccountScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    addAddress: (context) =>
        AddAddressScreen(userId: FirebaseAuth.instance.currentUser!.uid),
  };
}
