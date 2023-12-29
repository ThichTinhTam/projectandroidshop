

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectandroid/models/user-model.dart';
import 'package:projectandroid/controller/signup.dart';
import 'package:projectandroid/pages/LoginPage.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset("images/login.png", height: 250),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    Icon(
                      Icons.email,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: userEmail,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Email",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    Icon(
                      Icons.person,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Username",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white10.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 250,
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.black,fontFamily: 'SFUIDisplay'
                        ),
                        controller: userPassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
                  Material(
                      child: Container(
                        width: Get.width / 2,
                        height: Get.height / 18,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextButton(
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.black45),
                          ),
                          onPressed: () async {
                            String name = username.text.trim();
                            String email = userEmail.text.trim();
                            String password = userPassword.text.trim();

                            if (name.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Vui lòng điền đầy đủ thông tin",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.orange,
                                colorText: Colors.black45,
                              );
                            } else {
                              UserCredential? userCredential =
                              await signUpController.signUpMethod(
                                name,
                                email,
                                password,
                              );
                              if (userCredential != null) {
                                Get.snackbar(
                                  "Gửi email xác minh.",
                                  "Vui lòng kiểm tra email của bạn.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.orange,
                                  colorText: Colors.black45,
                                );

                                FirebaseAuth.instance.signOut();
                                Get.offAll(() => LoginPage());
                              }
                            }
                          },
                        ),
                      ),
                    ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? - ",
                    style: TextStyle(
                      color: Color(0xFF475269).withOpacity(0.3),
                      fontSize: 16,
                    ),
                  ),
                  TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),),),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color(0xFF475269),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
