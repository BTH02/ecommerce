import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/ui/06/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  List<DocumentSnapshot> _searchResults = [];

  // Truy vấn Firestore để tìm kiếm dữ liệu theo từ khóa
  Future<void> _performSearch() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('product');
    CollectionReference collectionSale =
    FirebaseFirestore.instance.collection('product-sale');

    // Thực hiện tìm kiếm dựa trên từ khóa
    QuerySnapshot querySnapshot = await collection
        .where('name_lower', isGreaterThanOrEqualTo: widget.query)
        .where('name_lower', isLessThanOrEqualTo: '${widget.query}\uf8ff')
        .get();
    QuerySnapshot querySnapshotSale = await collectionSale
        .where('name_lower', isGreaterThanOrEqualTo: widget.query)
        .where('name_lower', isLessThanOrEqualTo: '${widget.query}\uf8ff')
        .get();
    setState(() {
      _searchResults = [
        ...querySnapshot.docs, // Thêm tất cả kết quả từ product
        ...querySnapshotSale.docs // Thêm tất cả kết quả từ product-sale
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _performSearch(); // Thực hiện tìm kiếm khi màn hình được khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
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
                  width: 100,
                ),
                const Text('Tìm kiếm'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('Result for \" $text\"'),
                Text('${_searchResults.length.toString()} kết quả')
              ],
            ),
            _searchResults.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = _searchResults[index];
                      final productId = document.id;
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          final user = FirebaseAuth.instance.currentUser;
                          final userId = user?.uid;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                    productData: data,
                                    userId: userId.toString(),
                                    productId: productId),
                              ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 170,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                        imageUrl: '${data['images'][0]}'),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: const Icon(
                                              Icons.favorite_border)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    data['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text('${data['rating']}')
                                  ],
                                ),
                              ],
                            ),
                            Text('\$${data['price']}')
                          ],
                        ),
                      );
                    },
                  )
                : const Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Center(
                        child: Text('Không có kết quả.'),
                      ),
                    ],
                  )
          ],
        ),
      ),
    ));
  }
}
