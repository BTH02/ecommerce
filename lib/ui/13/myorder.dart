import 'package:ecommerce/ui/13/active.dart';
import 'package:ecommerce/ui/13/cancelled.dart';
import 'package:ecommerce/ui/13/completed.dart';
import 'package:ecommerce/ui/modal/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(width: 1, color: Colors.black)),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
          ),
          title: const Text('Đơn hàng'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Center(
                  child: Text('Hoạt động'),
                ),
              ),
              Tab(
                child: Center(
                  child: Text('Hoàn thành'),
                ),
              ),
              Tab(
                child: Center(
                  child: Text('Đã hủy'),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Active(userId: FirebaseAuth.instance.currentUser!.uid,),
            Completed(product: Product.pure(),),
            const Cancelled(),
          ],
        ),
      ),
    );
  }
}
