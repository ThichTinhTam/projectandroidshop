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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F9FD),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF475269).withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                               Get.to(() => CartScreen());
                                    },
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.redAccent,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F9FD),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF475269).withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: badges.Badge( badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        badgeColor: Colors.redAccent,
                        padding: EdgeInsets.all(7),
                      ),
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Color(0xFF475269),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              BannersWidget(),
              SizedBox(height: 10),
              Container(
                child: Text(
                    "Categories ",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black45),
                ),
              ),
              SizedBox(height: 10),
              RowItemsWidget(),
              SizedBox(height: 10),
              Container(
                child: Text(
                  "Products ",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black45),
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
