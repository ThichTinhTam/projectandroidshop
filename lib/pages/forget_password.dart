import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectandroid/pages/LoginPage.dart';

class ForgetPassword extends StatelessWidget {
  //const Signup({super.key});

  TextEditingController _emailController = TextEditingController();

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
              const Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 32,fontWeight: FontWeight.bold
                ),
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
                      Icons.email_outlined,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter email",
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.sendPasswordResetEmail(
                      email: _emailController.text,
                  ).then((value) => {
                    Navigator.of(context).pop(),
                  });
                  //
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
                    "Reset",
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
                    "Know Password? - ",
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
