import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectandroid/models/product-model.dart';
import '../widgets/ItemProduct.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({Key? key}) : super(key: key);

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> _searchResults = [];

  @override
  void initState() {
    super.initState();
    // Tìm kiếm ban đầu khi mở trang
    _searchProducts('');
  }

  void _searchProducts(String keyword) {
    FirebaseFirestore.instance
        .collection('products')
        .where('productName', isGreaterThanOrEqualTo: keyword)
        .where('productName', isLessThan: keyword + 'z')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        _searchResults = querySnapshot.docs
            .map((doc) => ProductModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Tìm kiếm'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    _searchProducts(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm sản phẩm...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? Center(
              child: Text('Không có kết quả tìm kiếm'),
            )
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                ProductModel productModel = _searchResults[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => ItemProduct(productModel: productModel)),
                      child: ListTile(
                        title: Text(productModel.productName),
                        leading: Image.network(
                          productModel.productImages,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        trailing: Text('${productModel.price} VND'),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

