import 'package:ecommerce/ui/13/active.dart';
import 'package:ecommerce/ui/13/cancelled.dart';
import 'package:ecommerce/ui/13/completed.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
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
            title: const Text('My Order'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Center(
                    child: Text('Active'),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text('Competed'),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text('Cancelled'),
                  ),
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Active(),
              Completed(),
              Cancelled(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
