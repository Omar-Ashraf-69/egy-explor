import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  String password;
  String email;
  String profilePic;
  String userName;
  String phoneNumber;
  String countryCode;

  UserModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.password,
    required this.profilePic,
    required this.phoneNumber,
    required this.countryCode,
  });

  factory UserModel.fromDocument(DocumentSnapshot snap) {
    Map<String, dynamic> snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      email: snapshot['email'],
      password: snapshot['password'],
      profilePic: snapshot['profilePic'],
      phoneNumber: snapshot['phoneNumber'],
      countryCode: snapshot['countryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'password': password,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
    };
  }
}
