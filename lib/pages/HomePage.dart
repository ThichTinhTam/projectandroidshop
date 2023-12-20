import 'package:projectandroid/widgets/AllProducts.dart';
import 'package:projectandroid/widgets/BannersWidget.dart';
import 'package:projectandroid/widgets/RowItemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:projectandroid/widgets/BottomCartSheet.dart';

import '../widgets/HomeBottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('VietShoe',
          style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => CartScreen());
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Center(// Màu xanh của thanh
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "VietShoe, nơi nâng niu bàn chân Việt",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Màu chữ trắng
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              BannersWidget(),
              SizedBox(height: 10),
              Container(
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Center(// Màu xanh của thanh
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Loại sản phẩm",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Màu chữ trắng
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              RowItemsWidget(),
              SizedBox(height: 10),
              Container(
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Center(// Màu xanh của thanh
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sản phẩm",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Màu chữ trắng
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AllProducts(),
              //AllItemsWidget(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
