
import 'dart:async';

import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFCEDDEE),
      ),
      routes: {
        "/" : (context) => LoginPage(),
        "homePage" : (context) => HomePage(),
        "itemPage" : (context) => ItemPage(),
        "User"     : (context) => User(),
      },
    );
  }
}


