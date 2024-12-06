import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues _currentRangeValues = const RangeValues(2, 150);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
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
                    width: 100,
                  ),
                  const Text('Filter'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Brands'),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildScroll('All', 60),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildScroll('Nike', 60),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildScroll('Adidas', 60),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildScroll('Puma', 60),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildScroll('Gucci', 60),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Gender'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildScroll('All', 60),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildScroll('Men', 60),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildScroll('Women', 60),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Sort By'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildScroll('Most Recent', 100),
                  _buildScroll('Popular', 80),
                  _buildScroll('Price High', 90),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Pricing Range'),
              const SizedBox(
                height: 10,
              ),
              RangeSlider(
                min: 2,
                max: 150,
                divisions: 5,
                values: _currentRangeValues,
                onChanged: (value) {
                  setState(() {
                    _currentRangeValues = value;
                  });
              },),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('2'),
                    Text('7'),
                    Text('22'),
                    Text('50'),
                    Text('100'),
                    Text('150+'),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              const Text('Reviews'),
              const SizedBox(height: 10,),
              _buildReview('4.5 and above'),
              _buildReview('4.0 - 4.5'),
              _buildReview('3.5 - 4.0'),
              _buildReview('3.0 - 3.5'),
              _buildReview('2.5 - 3.0'),
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
                      'Reset Filter',
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
                      'Apply',
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

Widget _buildScroll(String text, double width) {
  return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(20), left: Radius.circular(20))),
      child: Center(child: Text(text)));
}

Widget _buildReview(String text){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: Icon(Icons.star,color: Colors.yellow,),
          ),
          const SizedBox(
            width: 20,
            height: 20,
            child: Icon(Icons.star,color: Colors.yellow,),
          ),
          const SizedBox(
            width: 20,
            height: 20,
            child: Icon(Icons.star,color: Colors.yellow,),
          ),
          const SizedBox(
            width: 20,
            height: 20,
            child: Icon(Icons.star,color: Colors.yellow,),
          ),
          const SizedBox(
            width: 20,
            height: 20,
            child: Icon(Icons.star,color: Colors.yellow,),
          ),
          const SizedBox(width: 20,),
          Text(text),

        ],
      ),
      Radio(value: true, groupValue: true, onChanged: (value) {

      },)
    ],
  );
}