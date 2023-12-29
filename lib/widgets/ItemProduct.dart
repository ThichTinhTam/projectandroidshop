

import 'package:projectandroid/widgets/BottomCartSheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectandroid/models/product-model.dart';
import 'package:projectandroid/models/cart-model.dart';

import '../controller/productquatity.dart';




class ItemProduct extends StatefulWidget {
  ProductModel productModel;
  ItemProduct({super.key, required this.productModel});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductQuantityController productQuantityController = Get.put(ProductQuantityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async{
                // Xử lý khi nhấn nút "Thêm vào giỏ hàng"
                await checkProductExistence(uId: user!.uid);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                     // Get.to(() => CartScreen());
                      await checkProductExistence(uId: user!.uid);
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Thêm vào giỏ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Thông tin sản phẩm"),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 18, bottom: 8, right: 10, left: 10),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                  ),
                  Positioned(
                      top: 15,
                      left: 4,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Obx
                          ( ()=>Text(
                          '${productQuantityController.soluong.value}', // Số lượng sản phẩm trong giỏ hàng
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ),

                      )),
                ]
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height/60),
            Hero(
              tag: 'product_${widget.productModel.productID}',
              child: Container(
                height: Get.height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.productModel.productImages),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.productName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.productModel.price + " VND",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Giới thiệu',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.productModel.productDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> checkProductExistence({
    required String uId,
    int quantityIncrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.productModel.productID.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;

      //epkieu
      String giaString = widget.productModel.price.replaceAll('.', '');
      double giaDouble = double.parse(giaString);

      double totalPrice = giaDouble*updatedQuantity;
      print("Tong tien la");
      print(totalPrice);

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });
      Get.snackbar(
        "Thêm sản phẩm vào giỏ hàng thành công",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.green,
      );
      productQuantityController.fetchProductQuantity();
      print("product exists");
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );
      //epkieu
      String giaString = widget.productModel.price.replaceAll('.', '');
      double giaDouble = double.parse(giaString);
      CartModel cartModel = CartModel(
        productID: widget.productModel.productID,
        categoryId: widget.productModel.categoryId,
        productName: widget.productModel.productName,
        categoryName: widget.productModel.categoryName,
        price: widget.productModel.price,
        productImages: widget.productModel.productImages,
        productDescription: widget.productModel.productDescription,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productQuantity: 1,
        productTotalPrice: giaDouble,
      );

      await documentReference.set(cartModel.toMap());
      Get.snackbar(
        "Thêm sản phẩm vào giỏ hàng thành công",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.green,
      );
      productQuantityController.fetchProductQuantity();
      print("đã thêm ");
      print(widget.productModel.productImages);
      print(giaDouble);
    }
  }
}


