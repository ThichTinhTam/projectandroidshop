import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';
import 'package:projectandroid/models/categories-model.dart';
import 'package:projectandroid/widgets/SingleCategoryProducts.dart';

class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('categories').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            print("Error: ${snapshot.error}");
            return Center(
              child: Text("loi"),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Container(
              height: 100,
              child: Center(
                child: CupertinoActionSheet(),
              ),
            );
          }
          if(snapshot.data!.docs.isEmpty){
            return Center(child: Text("No category found!"),
            );
          }
          if(snapshot.data != null){
            return Container(
              height: 220,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    CategoriesModel categoriesModel = CategoriesModel(
                        categoryId: snapshot.data!.docs[index]['categoryId'],
                        categoryImg: snapshot.data!.docs[index]['categoryImg'],
                        categoryName: snapshot.data!.docs[index]['categoryName'],
                        createdAt: snapshot.data!.docs[index]['createdAt'],
                        updatedAt: snapshot.data!.docs[index]['updatedAt'],
                    );

                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => SingleCategoryProducts(
                            categoryId: categoriesModel.categoryId
                          )),
                          child: Padding(padding: EdgeInsets.all(5.0),
                            child: Container(child: FillImageCard(
                              borderRadius: 20,
                              width: 150,
                              heightImage: 140,
                              imageProvider: CachedNetworkImageProvider(categoriesModel.categoryImg),
                              title: Center(child: Text(categoriesModel.categoryName,
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.orange),
                              ),
                              ),
                              footer: Text(''),
                            ),),
                          ),
                        ),
                      ],
                  );
              }),
            );
          }
          return Container();
        },
    );
  }
}
