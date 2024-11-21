import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser;
final userId = user?.uid;

Future<void> addToCartWithProductInfo(
  String userId,
  String productId,
  int quantity,
  String selectedSize,
  String selectedColor,
) async {
  final cartRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('cart');
  final productRef =
      FirebaseFirestore.instance.collection('product').doc(productId);
  final productSaleRef =
      FirebaseFirestore.instance.collection('product-sale').doc(productId);

  try {
    // Lấy thông tin sản phẩm từ collection 'product' hoặc 'productsale'
    DocumentSnapshot productSnapshot;
    DocumentSnapshot saleSnapshot;

    // Kiểm tra xem sản phẩm có trong collection 'product' hay không
    productSnapshot = await productRef.get();

    // Nếu không tìm thấy trong 'product', kiểm tra trong 'productsale'
    if (!productSnapshot.exists) {
      saleSnapshot = await productSaleRef.get();
      if (!saleSnapshot.exists) {
        print("Sản phẩm không tồn tại trong cả hai collection.");
        return;
      }
      // Nếu sản phẩm tồn tại trong 'productsale'
      final productData = saleSnapshot.data() as Map<String, dynamic>;
      final productName = productData['name'];
      final productPrice = productData['price'];
      final productImageUrl = productData['images'][0];

      // Kiểm tra nếu sản phẩm với size cụ thể đã tồn tại trong giỏ hàng
      final querySnapshot = await cartRef
          .where('productId', isEqualTo: productId)
          .where('color', isEqualTo: selectedColor)
          .where('size', isEqualTo: selectedSize)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Nếu sản phẩm với size đã tồn tại, tăng số lượng
        final doc = querySnapshot.docs.first;
        final currentQuantity = doc['quantity'];
        await cartRef
            .doc(doc.id)
            .update({'quantity': currentQuantity + quantity});
        print("Đã cập nhật số lượng sản phẩm trong giỏ hàng.");
      } else {
        // Nếu sản phẩm chưa tồn tại, thêm mới với thông tin từ productsale
        await cartRef.add({
          'productId': productId,
          'size': selectedSize,
          'quantity': quantity,
          'productName': productName,
          'price': productPrice,
          'img': productImageUrl,
          'color': selectedColor,
        });
        print("Đã thêm sản phẩm mới vào giỏ hàng.");
      }
    } else {
      // Nếu sản phẩm tồn tại trong 'product'
      final productData = productSnapshot.data() as Map<String, dynamic>;
      final productName = productData['name'];
      final productPrice = productData['price'];
      final productImageUrl = productData['images'][0];

      // Kiểm tra nếu sản phẩm với size cụ thể đã tồn tại trong giỏ hàng
      final querySnapshot = await cartRef
          .where('productId', isEqualTo: productId)
          .where('color', isEqualTo: selectedColor)
          .where('size', isEqualTo: selectedSize)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Nếu sản phẩm với size đã tồn tại, tăng số lượng
        final doc = querySnapshot.docs.first;
        final currentQuantity = doc['quantity'];
        await cartRef
            .doc(doc.id)
            .update({'quantity': currentQuantity + quantity});
        print("Đã cập nhật số lượng sản phẩm trong giỏ hàng.");
      } else {
        // Nếu sản phẩm chưa tồn tại, thêm mới với thông tin từ products
        await cartRef.add({
          'productId': productId,
          'size': selectedSize,
          'quantity': quantity,
          'productName': productName,
          'price': productPrice,
          'img': productImageUrl,
          'color': selectedColor,
        });
        print("Đã thêm sản phẩm mới vào giỏ hàng.");
      }
    }
  } catch (e) {
    print("Lỗi khi thêm sản phẩm vào giỏ hàng: $e");
  }
}

Future<void> deleteCartItem(String cartItemId) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(cartItemId)
        .delete();

    print("Cart item deleted successfully");
  } catch (e) {
    print("Failed to delete cart item: $e");
  }
}
