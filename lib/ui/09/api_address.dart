import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addAddress({
  required String userId,
  required String address,
  bool isDefault = false, // Không cần xử lý "mặc định"
}) async {
  final addressesRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('addresses');

  try {
    // Chỉ thêm địa chỉ mới mà không quan tâm đến trạng thái mặc định
    await addressesRef.add({
      'address':address,
      'isDefault': isDefault,
    });
    print("Đã thêm địa chỉ mới thành công!");
  } catch (e) {
    print("Lỗi khi thêm địa chỉ: $e");
  }
}