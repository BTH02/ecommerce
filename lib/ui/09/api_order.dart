import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> moveCartToOrders(String userId) async {
  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  // Reference đến Firestore
  final firestore = FirebaseFirestore.instance;

  // Reference đến subcollections và collections
  final cartRef = firestore.collection('users').doc(userId).collection('cart');
  final ordersRef = firestore.collection('orders');
  final userRef = firestore.collection('users').doc(userId);
  try {
    // 1. Lấy sản phẩm từ `cart`
    final cartSnapshot = await cartRef.get();
    if (cartSnapshot.docs.isEmpty) {
      print("Cart của user $userId đang rỗng.");
      return;
    }

    List<Map<String, dynamic>> products = cartSnapshot.docs.map((doc) {
      return {
        ...doc.data(),
        'productId': doc.id,
      };
    }).toList();

    // 2. Lấy địa chỉ từ `cart` (ví dụ, địa chỉ có thể được lưu trong field 'address' của cart)
    Map<String, dynamic>? addressData;
    final addressDoc = await cartRef.doc('address').get();  // Lấy document có ID là 'address'

    if (addressDoc.exists) {
      addressData = addressDoc.data() as Map<String, dynamic>;
    }

    if (addressData == null || !addressData.containsKey('address')) {
      print("Không tìm thấy địa chỉ trong cart.");
      return;
    }
    // name người dùng
    String? userName;
    final userDoc = await userRef.get();
    if (userDoc.exists) {
      userName = userDoc.data()?['fullName'];  // Assuming the user's name is stored in Firestore
    }

    if (userName == null) {
      print("Không tìm thấy tên người dùng.");
      return;
    }
    // 3. Tạo dữ liệu order
    final orderData = {
      'userId': userId,
      'userName': userName,
      'products': products,
      'address': addressData, // Thêm thông tin địa chỉ vào order
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    };

    // 4. Lưu order vào `orders`
    await ordersRef.add(orderData);

    // 5. Xóa dữ liệu trong `cart`
    final batch = firestore.batch();
    for (var doc in cartSnapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();

    print("Đã chuyển cart và địa chỉ sang orders thành công!");
  } catch (e) {
    print("Lỗi khi chuyển dữ liệu: $e");
  }
}
