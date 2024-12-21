part of 'my_cart_bloc.dart';

class MyCartEvent {
  const MyCartEvent();
}

class CreateOrder extends MyCartEvent {
  final Function(String zptoken)? onSuccess;
  final double price;

  const CreateOrder({required this.price, this.onSuccess});
}
