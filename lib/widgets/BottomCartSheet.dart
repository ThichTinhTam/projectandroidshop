import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectandroid/models/product-model.dart';
import 'package:projectandroid/models/cart-model.dart';
import 'package:projectandroid/controller/price-controller.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:projectandroid/widgets/thanhtoan.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController =
  Get.put(ProductPriceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Row(
          children: [
            Icon(Icons.shopping_cart,
              color: Colors.white,
              size: 25,
            ),
            Text(' Giỏ Hàng'),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .collection('cartOrders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: Center(
            //    child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("khong co san pham!"),
            );
          }

          if (snapshot.data != null) {
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final productData = snapshot.data!.docs[index];
                  CartModel cartModel = CartModel(
                    productID: productData['productID'],
                    categoryId: productData['categoryId'],
                    productName: productData['productName'],
                    categoryName: productData['categoryName'],
                    price: productData['price'],
                    productImages: productData['productImages'],
                    productDescription: productData['productDescription'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt'],
                    productQuantity: productData['productQuantity'],
                    productTotalPrice: double.parse(
                        productData['productTotalPrice'].toString()),
                  );
                  String giaString = cartModel.price.replaceAll('.', '');
                  double giaDouble = double.parse(giaString);
                  double total = cartModel.productTotalPrice;


                  final formatter = NumberFormat('#,###');
                  String totalString = formatter.format(total);
                  //calculate price
                  productPriceController.fetchProductPrice();

                  return SwipeActionCell(
                    key: ObjectKey(cartModel.productID),
                    trailingActions: [
                      SwipeAction(
                        title: "Delete",
                        forceAlignmentToBoundary: true,
                        performsFirstActionWithFullSwipe: true,
                        onTap: (CompletionHandler handler) async {
                          print('deleted');
                          await FirebaseFirestore.instance
                              .collection('cart')
                              .doc(user!.uid)
                              .collection('cartOrders')
                              .doc(cartModel.productID)
                              .delete();
                        },
                      )
                    ],
                    child: Container(
                      height: 110,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.orangeAccent,
                              backgroundImage:
                              NetworkImage(cartModel.productImages),
                            ),
                            title: Text(cartModel.productName,
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black87)
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  totalString,
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.redAccent)
                                  ,),
                                SizedBox(
                                  width: Get.width / 7.0,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (cartModel.productQuantity > 1) {
                                      await FirebaseFirestore.instance
                                          .collection('cart')
                                          .doc(user!.uid)
                                          .collection('cartOrders')
                                          .doc(cartModel.productID)
                                          .update({
                                        'productQuantity':
                                        cartModel.productQuantity - 1,
                                        'productTotalPrice':
                                        ((giaDouble) *
                                            (cartModel.productQuantity - 1))
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: Colors.grey,
                                    child: Text('-'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10,left: 10),
                                  child: Text('${cartModel.productQuantity}'),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (cartModel.productQuantity > 0) {
                                      await FirebaseFirestore.instance
                                          .collection('cart')
                                          .doc(user!.uid)
                                          .collection('cartOrders')
                                          .doc(cartModel.productID)
                                          .update({
                                        'productQuantity':
                                        cartModel.productQuantity + 1,
                                        'productTotalPrice':
                                        (giaDouble)  +
                                            (giaDouble) *
                                                (cartModel.productQuantity)
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: Colors.grey,
                                    child: Text('+'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return Container();
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
                  () => Text(
                " Tổng tiền: ${NumberFormat('#,###').format(productPriceController.totalPrice.value)} VND",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2.0,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "Mua hàng",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    onPressed: () {
                     Get.to(() => DatHang());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
