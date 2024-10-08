class Product {
  final int id;
  final String pathImage;
  final String name;
  final int price;
  double? vote;
  final String style;
  final String detail;

  Product({
    required this.id,
    required this.pathImage,
    required this.name,
    required this.price,
    required this.vote,
    required this.detail,
    required this.style,
  });

  factory Product.pure() {
    return Product(
        id: 100,
        pathImage: 'images/product/jacket1',
        name: 'Jacket1',
        price: 10,
      vote: 1.0,
      detail: 'Jacket1',
      style: 'male'
    );
  }
}
