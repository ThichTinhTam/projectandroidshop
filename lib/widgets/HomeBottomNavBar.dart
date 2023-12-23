import 'package:get/get.dart';
import 'package:projectandroid/widgets/BottomCartSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../controller/productquatity.dart';




class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductQuantityController productQuantityController = Get.put(ProductQuantityController());
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "homePage");
            },
            child: Icon(
              Icons.category_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 7, right: 10, left: 22),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.redAccent,
                    size: 32,
                  ),
                ),
                Positioned(
                  top: 2,
                  left: 18,
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
                    child: Obx(() => Text(
                      '${productQuantityController.soluong.value}',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ],
            ),
          ),
          // Icon(
          //   Icons.favorite_border,
          //   color: Colors.white,
          //   size: 32,
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "allorders");
            },
            child: Icon(
              Icons.local_shipping,
              color: Colors.white,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "User");
            },
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "aboutus");
            },
            child: Icon(
              Icons.info_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {Navigator.pushNamed(context, "/");},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
