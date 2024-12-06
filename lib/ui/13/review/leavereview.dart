import 'package:flutter/material.dart';

import '../../modal/product.dart';

class LeaveReview extends StatefulWidget {
  const LeaveReview({super.key, required this.productReview});

  final Product productReview;

  @override
  State<LeaveReview> createState() => _LeaveReviewState();
}

class _LeaveReviewState extends State<LeaveReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)),
                ),
                const SizedBox(
                  width: 75,
                ),
                const Text('Leave Review'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(20), right: Radius.circular(20)),
                    child: Image.asset(
                      widget.productReview.pathImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productReview.name),
                    const Text('Size:'),
                    Row(
                      children: [
                        Text(widget.productReview.price.toString()),
                        const SizedBox(
                          width: 70,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 90,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(20),
                                  left: Radius.circular(20)),
                            ),
                            child: const Center(
                                child: Text(
                              'Re-Order',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 0.01,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('How is your order?',style: TextStyle(fontSize: 25),),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 0.01,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Your overall rating'),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10,right: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 0.01,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add detailed review'),
              ],
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(15),left: Radius.circular(15)),
                border: Border.all(color: Colors.black,width: 0.1)
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 10,top: 10),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter here')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset('images/camera.png'),
                ),
                const SizedBox(width: 5,),
                const Text('add photo')
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30))),
                child: const Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                width: 150,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30))),
                child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
