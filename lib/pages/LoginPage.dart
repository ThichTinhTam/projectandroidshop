import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectandroid/pages/forget_password.dart';

import 'Signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailAddressController = TextEditingController();
    TextEditingController _passwordAddressController = TextEditingController();
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
                      Icons.person,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: _emailAddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Username",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                        controller: _passwordAddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Color(0xFF475269),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  String email = _emailAddressController.text.trim();
                  String pass = _passwordAddressController.text.trim();
                  if (email.isEmpty || pass.isEmpty) {
                    final snackBar = SnackBar(
                      content: Text('Bạn chưa nhập đầy đủ thông tin'),
                      backgroundColor: Colors.black12,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  // if (email == _emailAddressController  && pass == _passwordAddressController) {
                  //   final snackBar = SnackBar(
                  //     content: Text('Đăng nhập thành công'),
                  //     backgroundColor: Colors.black12,
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // }
                  //   if {
                  //     final snackBar = SnackBar(
                  //       content: Text('Đăng nhập không thành công'),
                  //       backgroundColor: Colors.black12,
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   }

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailAddressController.text,
                      password: _passwordAddressController.text).
                  then((value) => {

                  Navigator.pushNamed(context, "homePage")
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF475269),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account? - ",
                    style: TextStyle(
                      color: Color(0xFF475269).withOpacity(0.3),
                      fontSize: 16,
                    ),
                  ),
                  TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup(),),),
                      child: Text(
                        "Sign up",
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

