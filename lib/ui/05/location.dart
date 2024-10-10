import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationAccess extends StatefulWidget {
  const LocationAccess({super.key});

  @override
  State<LocationAccess> createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: const Icon(
                Icons.location_on,
                size: 100,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text('What is Your Location?'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Column(
              children: [
                Text('We need to know your location in order to suggest'),
                Text('nearby services.'),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: const Center(
              child: Text(
                'Allow Location Access',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.yourlocation),
            child: const Center(
              child: Text('Enter Location Manually'),
            ),
          )
        ],
      ),
    );
  }
}
