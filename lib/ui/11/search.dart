import 'package:ecommerce/ui/11/search_item.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  void _navigateToResultsScreen(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchItem(query: query),
      ),
    );
  }

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
                  width: 100,
                ),
                const Text('Tìm kiếm'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30))),
              child: TextField(
                onSubmitted: (value) {
                  String query = _searchController.text.trim().toLowerCase();
                  if (query.isNotEmpty) {
                    _navigateToResultsScreen(
                        query); // Điều hướng với từ khóa tìm kiếm
                  }
                },
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {
                          String query =
                              _searchController.text.trim().toLowerCase();
                          if (query.isNotEmpty) {
                            _navigateToResultsScreen(
                                query); // Điều hướng với từ khóa tìm kiếm
                          }
                        },
                        icon: const Icon(Icons.search)),
                    hintText: 'Tìm kiếm',
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gần đây '),
                Text('Xóa hết'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
              height: 0.01,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Áo phông xanh'),
                SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset('images/close.png'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Áo phông đỏ'),
                SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset('images/close.png'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Quần jean'),
                SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset('images/close.png'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
