import 'package:flutter/material.dart';

class YourLocation extends StatefulWidget {
  const YourLocation({super.key});

  @override
  State<YourLocation> createState() => _YourLocationState();
}

class _YourLocationState extends State<YourLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
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
                const Text('Enter Your Location'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30))),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Golden Avenue',
                  border: InputBorder.none,
                  suffixIcon: Container(
                      margin:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      child: Image.asset(
                        'images/close.png',
                        height: 10,
                        width: 10,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('images/ylocation.png'),
                ),
                const SizedBox(width: 10,),
                const Text('Use my current location'),
              ],
            ),
            const SizedBox(height: 15,),
            const Divider(
              color: Colors.black,
              height: 0.01,
            ),
            const SizedBox(height: 15,),
            const Text('SEARCH RESULT'),
            const SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset('images/ylocation.png'),
                ),
                const SizedBox(width: 10,),
                const Text('Golden Avenue'),
              ],
            ),
            const Text('8502, Golden Avenue'),
          ],
        ),
      ),
    );
  }
}
