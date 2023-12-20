import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../controller/usercontroller.dart';
import '../models/user-model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());

  Future<String> getUsername() async {
    List<QueryDocumentSnapshot<Object?>> userData = await getUserDataController.getUserData(user!.uid);
    if (userData.isNotEmpty) {
      UserModel userModel = UserModel.fromMap(userData[0].data() as Map<String, dynamic>);
      print(userModel.username);
      return userModel.username;
    } else {
      throw Exception('khong tim thay uId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<String>(
        future: getUsername(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'chào bạn ${snapshot.data!}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('Email: ${user?.email ?? 'Not available'}', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      Text(
                        'Cảm ơn bạn đã đến với VietShoe, hân hạnh được phục vụ quý khách',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
