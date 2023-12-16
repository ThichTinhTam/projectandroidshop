import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectandroid/pages/HomePage.dart';
import 'package:projectandroid/pages/LoginPage.dart';
import 'package:projectandroid/pages/User.dart';
import 'package:projectandroid/pages/itemPage.dart';
import 'package:firebase_core/firebase_core.dart';

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
        GetPage(name: '/itemPage', page: () => ItemPage()),
        GetPage(name: '/User', page: () => User()),
      ],
      initialRoute: '/',
    );
  }
}
