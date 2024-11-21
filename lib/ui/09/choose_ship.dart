import 'package:flutter/material.dart';

class ChooseShip extends StatefulWidget {
  const ChooseShip({super.key});

  @override
  State<ChooseShip> createState() => _ChooseShipState();
}

class _ChooseShipState extends State<ChooseShip> {
  String? _selectedShip;

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
                const Text('Lựa chọn giao hàng'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset('images/shipbox.png')),
                      const Text(
                        'Giao hàng thông thường',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          value: 'Giao hàng thông thường',
                          groupValue: _selectedShip,
                          onChanged: (value) {
                            setState(() {
                              _selectedShip = value;
                            });
                          },
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
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset('images/shipbox.png')),
                          const Text(
                            'Giao hàng nhanh',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          value: 'Giao hàng nhanh',
                          groupValue: _selectedShip,
                          onChanged: (value) {
                            setState(() {
                              _selectedShip = value;
                            });
                          },
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
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset('images/ship.png')),
                          const Text(
                            'Giao hàng hỏa tốc',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          value: 'Giao hàng hỏa tốc',
                          groupValue: _selectedShip,
                          onChanged: (value) {
                            setState(() {
                              _selectedShip = value;
                            });
                          },
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
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset('images/fastship.png')),
                          const Text(
                            'Giao hàng tiết kiệm',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          value: 'Giao hàng tiết kiệm',
                          groupValue: _selectedShip,
                          onChanged: (value) {
                            setState(() {
                              _selectedShip = value;
                            });
                          },
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
            ),
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
          child: GestureDetector(
            onTap: () {
              // if(_selectedShip != null){
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(selectedAddress:'Chưa chọn địa chỉ',selectedShip: _selectedShip,),));
              // }else{
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text("Vui lòng chọn một tùy chọn!")),
              //   );
              // }
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              child: const Center(
                  child: Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
