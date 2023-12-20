// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String email;
  final String uId;
  final String username;
  final dynamic createdOn;


  UserModel({
    required this.email,
    required this.uId,
    required this.username,
    required this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uId': uId,
      'username': username,
      'createdOn': createdOn,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      uId: json['uId'],
      username: json['username'],
      createdOn: json['createdOn'],
    );
  }
}
