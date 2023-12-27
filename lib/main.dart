import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectandroid/pages/HomePage.dart';
import 'package:projectandroid/pages/LoginPage.dart';
import 'package:projectandroid/pages/User.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectandroid/pages/about.dart';
import 'package:projectandroid/pages/aboutus.dart';
import 'package:projectandroid/pages/search.dart';
import 'package:projectandroid/widgets/allorder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFCEDDEE),
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/homePage', page: () => HomePage()),
        GetPage(name: '/search', page: () => SearchProducts()),
        GetPage(name: '/allorders', page: () => AllOrdersScreen()),
        // GetPage(name: '/itemPage', page: () => ItemPage()),
        GetPage(name: '/User', page: () => UserProfile()),
        GetPage(name: '/aboutus', page: () => AboutUs()),
        GetPage(name: '/about', page: () => About()),
      ],
      initialRoute: '/',
    );
  }
}
