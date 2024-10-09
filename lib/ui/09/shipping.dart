import 'package:flutter/material.dart';

class ChooseShip extends StatefulWidget {
  const ChooseShip({super.key});

  @override
  State<ChooseShip> createState() => _ChooseShipState();
}

class _ChooseShipState extends State<ChooseShip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
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
                  width: 80,
                ),
                const Text('Choose Shipping'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildChooseShip('Economy', 'images/shipbox.png'),
            _buildChooseShip('Regular', 'images/shipbox.png'),
            _buildChooseShip('Cargo', 'images/ship.png'),
            _buildChooseShip('Friend House', 'images/fastship.png'),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Center(
          child: Container(
            width: 250,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: const Center(
                child: Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ),
    );
  }
}

Widget _buildChooseShip(String nameShip, String nameImg) {
  return SizedBox(
    height: 100,
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(width: 30, height: 30, child: Image.asset(nameImg)),
            Text(
              nameShip,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 32),
              child: const Text('HM DP HN'),
            ),
            Transform.scale(
              scale: 1.5,
              child: Radio(
                value: true,
                groupValue: true,
                onChanged: (value) {},
              ),
            )
          ],
        ),
        const Divider(
          color: Colors.black,
          height: 0.01,
        ),
      ],
    ),
  );
}
