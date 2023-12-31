import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:projectandroid/models/categories-model.dart';
import 'package:projectandroid/models/product-model.dart';
import 'package:projectandroid/widgets/ItemProduct.dart';

import '../controller/productquatity.dart';
import 'BottomCartSheet.dart';


class SingleCategoryProducts extends StatefulWidget {
  String categoryId;
  SingleCategoryProducts({super.key, required this.categoryId});

  @override
  State<SingleCategoryProducts> createState() => _SingleCategoryProductsState();
}

class _SingleCategoryProductsState extends State<SingleCategoryProducts> {
  final ProductQuantityController productQuantityController = Get.put(ProductQuantityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Sản phẩm'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
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
          ),
        ],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('products').where(
            'categoryId', isEqualTo: widget.categoryId)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            print("Error: ${snapshot.error}");
            return Center(
              child: Text("loi"),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Container(
              height: Get.height /5,
              child: Center(
           //     child: CupertinoActionSheet(),
              ),
            );
          }
          if(snapshot.data!.docs.isEmpty){
            return Center(child: Text("No category found!"),
            );
          }
          if(snapshot.data != null){
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.90,
                ),
              itemBuilder: (context,index){
                final productData = snapshot.data!.docs[index];
                ProductModel productModel = ProductModel(
                    categoryId: productData['categoryId'],
                    productID: productData['productID'],
                    categoryName: productData['categoryName'],
                    price: productData['price'],
                    productDescription: productData['productDescription'],
                    productImages: productData['productImages'],
                    productName: productData['productName'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt'],
                );
                // CategoriesModel categoriesModel = CategoriesModel(
                //   categoryId: snapshot.data!.docs[index]['categoryId'],
                //   categoryImg: snapshot.data!.docs[index]['categoryImg'],
                //   categoryName: snapshot.data!.docs[index]['categoryName'],
                //   createdAt: snapshot.data!.docs[index]['createdAt'],
                //   updatedAt: snapshot.data!.docs[index]['updatedAt'],
                // );
                return Row(
                  children: [

                       GestureDetector(
                         onTap: ()
                         => Get.to(() => ItemProduct(
                             productModel: productModel)),
                         child: Padding(padding: EdgeInsets.all(8.0),
                          child: Container(child: FillImageCard(
                            borderRadius: 20,
                            width: Get.width/2.4,
                            heightImage: Get.height/6,
                            imageProvider: CachedNetworkImageProvider(productModel.productImages),
                            title: Center(
                              child: Text(
                                productModel.productName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 15),
                            ),
                            ),
                            footer: Center(
                              child: Text(
                                productModel.price + " VND",
                                // style: TextStyle(fontSize: 5),
                              ),
                            ),
                          ),),
                      ),
                       ),

                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
