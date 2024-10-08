import 'package:flutter/material.dart';
class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60,),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(50)),border: Border.all(width: 1,color: Colors.black)),
                    child:  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
                  ),
                  const SizedBox(width: 70,),
                  const Text('My WishList'),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildScroll('All'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Jacket'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Dress'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('Pant'),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildScroll('T-Shirt'),
                    ],
                  ),
                ),
              ),
              // const ProductHome(),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildScroll(String text) {
  return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(20), left: Radius.circular(20))),
      child: Center(child: Text(text)));
}
