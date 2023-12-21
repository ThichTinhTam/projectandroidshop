import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/notifical.dart';
import '../widgets/AllProducts.dart';
import '../widgets/BannersWidget.dart';
import '../widgets/HomeBottomNavBar.dart';
import '../widgets/RowItemsWidget.dart';
import 'notifical.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.to(() => NotificalTest());
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 8, right: 20, left: 22),
                child: Icon(
                  Icons.notifications_active_sharp,
                  color: Colors.redAccent,
                  size: 35,
                ),
              ),
              // GetBuilder<NotificationController>(
              //   builder: (controller) {
              //     return controller.hasUnreadNotification.value
              //         ? Positioned(
              //       top: 0,
              //       right: 0,
              //       child: Container(
              //         padding: EdgeInsets.all(6),
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.red,
              //         ),
              //         child: Text(
              //           '!',
              //           style: TextStyle(
              //             color: Colors.orangeAccent,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     )
              //         : Container();
              //   },
              // ),
            ],
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'VietShoe',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 8, right: 20, left: 22),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "search");
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          )

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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "VietShoe, nơi nâng niu bàn chân Việt",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Loại sản phẩm",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sản phẩm",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AllProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
