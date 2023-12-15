import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:projectandroid/models/categories-model.dart';


class SingleCategoryProducts extends StatefulWidget {
  const SingleCategoryProducts({super.key});

  @override
  State<SingleCategoryProducts> createState() => _SingleCategoryProductsState();
}

class _SingleCategoryProductsState extends State<SingleCategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('ca').get(),
      ),
    );
  }
}
