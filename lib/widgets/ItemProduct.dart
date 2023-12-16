import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:projectandroid/models/categories-model.dart';
import 'package:projectandroid/models/product-model.dart';

class ItemProduct extends StatefulWidget {
  ProductModel productModel;
  ItemProduct({super.key, required this.productModel});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Products Details"
        ),
      ),
         body: Container(
           child: Column(
             children: [

               Container(
                 height: Get.height/3,
                 decoration: BoxDecoration(
                   image:  DecorationImage(
                         fit: BoxFit.fill,
                        image: NetworkImage(widget.productModel.productImages),
                   ),
                 ),
               ),
              // Image.network(widget.productModel.productImages)

             ],
           ),
         ),
    //   body: Container(
    //     child: Column(
    //       children: [
    //        //product images
    //     CarouselSlider(
    //     items: product.productImages
    //         .map(
    //         (imageUrls) =>
    //       ClipRRect(
    //       borderRadius: BorderRadius.circular(10.0),
    //       child: CachedNetworkImage(
    //          imageUrl: imageUrls,
    //          fit: BoxFit.cover,
    //          width: Get.width - 10,
    //            placeholder: (context, url) =>
    //         ColoredBox(
    //           color: Colors.white,
    //           child: Center(child: CupertinoActivityIndicator(),),
    //         ),
    //     errorWidget: (context,url,error) => Icon(Icons.error),
    //   ),
    // ),
    // ).toList(),
    // options: CarouselOptions(
    //   scrollDirection: Axis.horizontal,
    //   autoPlay: true,
    //   aspectRatio: 2.5,
    //   viewportFraction: 1,
    // ),
    // ),
    //       ],
    //     ),
    //   ),

    );
  }
}

