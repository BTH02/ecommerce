import 'package:ecommerce/ui/modal/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    required this.productItem,
  });

  final Product productItem;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              color: Colors.red,
              height: 350,
              // child: Image.asset('images/product/jacket1.png',fit: BoxFit.cover,),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const Text('Product Details'),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 60,
                color: Colors.yellow,
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(widget.productItem.style),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(widget.productItem.vote.toString()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.productItem.name),
                const SizedBox(
                  height: 20,
                ),
                const Text('Product Detail'),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: _isExpanded ? null : 60,
                      child: Text(
                        widget.productItem.detail,
                        overflow: TextOverflow.fade,
                        maxLines: 6,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? 'Read less' : 'Read more',
                        style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Select Size'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSize('S'),
                    buildSize('M'),
                    buildSize('L'),
                    buildSize('XL'),
                    buildSize('XXL'),
                    buildSize('XXXL'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Select Color: Brown'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    buildRadio(true, Colors.black, Colors.black),
                    buildRadio(
                      false,
                      Colors.cyan,
                      Colors.cyan,
                    ),
                    buildRadio(
                      true,
                      Colors.yellow,
                      Colors.yellow,
                    ),
                    buildRadio(
                      true,
                      Colors.blue,
                      Colors.blue,
                    ),
                    buildRadio(
                      true,
                      Colors.orange,
                      Colors.orange,
                    ),
                    buildRadio(
                      true,
                      Colors.green,
                      Colors.green,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 105,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text('Total Price'),
                    ],
                  ),
                  Text('\$${widget.productItem.price.toString()}'),
                ],
              ),
              Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(20), left: Radius.circular(20))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSize(String textSize) {
  return Container(
    width: 40,
    height: 40,
    decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(15), left: Radius.circular(15))),
    child: Center(
        child: Text(
      textSize,
      style: const TextStyle(color: Colors.white),
    )),
  );
}

Widget buildRadio(bool value, Color color, Color color2) {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: color2,
        borderRadius: const BorderRadius.all(Radius.circular(50))),
    child: Transform.scale(
      scale: 1.5,
      child: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        value: value,
        groupValue: false,
        onChanged: (value) {},
      ),
    ),
  );
}
