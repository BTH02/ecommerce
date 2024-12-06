
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> addProductWishList(String userId, String productId) async {
  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  final productRef = FirebaseFirestore.instance.collection('product').doc(productId);
  final cartRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('favourite')
      .doc(productId);

  // Lấy thông tin sản phẩm từ collection `products`
  final productDoc = await productRef.get();
  if (productDoc.exists) {
    final productData = productDoc.data()!;
    final productName = productData['name'];
    final price = productData['price'];
    final rating = productData['rating'];
    final img = productData['images'];
    final color = productData['color'];
    final size = productData['size'];
    final describe = productData['describe'];
    final genderStyle = productData['genderStyle'];

    // Kiểm tra nếu sản phẩm đã có trong giỏ hàng thì cập nhật số lượng
    final cartDoc = await cartRef.get();
    if (cartDoc.exists) {
      await cartRef.update({
        'addedAt': FieldValue.serverTimestamp(),
      });
    } else {
      // Thêm sản phẩm mới vào giỏ hàng
      await cartRef.set({
        'name': productName,
        'price': price,
        'images' : img,
        'rating':rating,
        'color':color,
        'size':size,
        'genderStyle':genderStyle,
        'describe':describe,
      });
    }
  } else {
    print("Sản phẩm không tồn tại.");
  }
}
Future<void> deleteFavouriteItem(String favouriteItemId) async {
  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favourite')
        .doc(favouriteItemId)
        .delete();

    print("Favourite item deleted successfully");
  } catch (e) {
    print("Failed to delete cart item: $e");
  }
}