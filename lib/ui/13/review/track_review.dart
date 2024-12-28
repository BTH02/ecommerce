import 'package:flutter/material.dart';

import '../../modal/product.dart';
class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key, required this.productTrack});
  final Product productTrack;
  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const Text('Track Review'),
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
                      widget.productTrack.pathImage,
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
                    Text(widget.productTrack.name),
                    const Text('Size:'),
                    Row(
                      children: [
                        Text(widget.productTrack.price.toString()),
                        const SizedBox(
                          width: 70,
                        ),
                      ],
                    )
                  ],
                )
              ],
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
            const Text('Order Details'),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Expected Delivery Date'),
                Text('03 Step 2024')
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tracking ID'),
                Text('TRK16516512')
              ],
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
            const Text('Order Status'),
            const SizedBox(height: 15,),
            const SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrderStage(
                    icon: Icons.check_circle,
                    stage: 'Order Placed',
                    date: '23 Aug 2023, 04:25 PM',
                    isCompleted: true,
                    nameImg: 'images/note.png',
                  ),
                  OrderStage(
                    icon: Icons.check_circle,
                    stage: 'In Progress',
                    date: '23 Aug 2023, 03:54 PM',
                    isCompleted: true,
                    nameImg: 'images/shipbox.png',
                  ),
                  OrderStage(
                    icon: Icons.check_circle,
                    stage: 'Shipped',
                    date: '02 Sep 2023',
                    isCompleted: false,
                    nameImg: 'images/fastship.png',
                  ),
                  OrderStage(
                    icon: Icons.check_circle,
                    stage: 'Delivered',
                    date: '23 Aug 2023',
                    isCompleted: false,
                    nameImg: 'images/shipbox.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderStage extends StatelessWidget {
  const OrderStage({super.key, required this.icon, required this.stage, required this.date, required this.isCompleted, required this.nameImg});
  final IconData icon;
  final String stage;
  final String date;
  final bool isCompleted;
  final String nameImg;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: isCompleted ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stage, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(date),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(nameImg),
        )
      ],
    );
  }
}
