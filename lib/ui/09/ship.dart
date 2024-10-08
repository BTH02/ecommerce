import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text('Shipping Address'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _buildShip('Home'),
              _buildShip('Office'),
              _buildShip('Parent House'),
              _buildShip('Friend House'),
              const SizedBox(
                height: 40,
              ),
              DottedBorder(
                dashPattern: const [6,3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(15),right: Radius.circular(15))
                  ),
                  child: const Center(
                    child: Text('+ Add New Shipping Address',style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
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

Widget _buildShip(String nameadr) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          const Icon(Icons.location_on),
          Text(
            nameadr,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: const Text('HM DP HN'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: const Text('HM DP HN'),
              ),
            ],
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
  );
}
