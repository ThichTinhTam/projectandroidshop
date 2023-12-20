import 'package:projectandroid/widgets/BottomCartSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';




class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "search");
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
            ),
          ),
          // Icon(
          //   Icons.favorite_border,
          //   color: Colors.white,
          //   size: 32,
          // ),
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
