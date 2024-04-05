import 'package:egy_exlpor/core/models/user.dart';
import 'package:egy_exlpor/core/services/auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? user;
  bool isLoading = true;

  getUserDetails() async {
    user = await Authentication().getUserDetails();
    isLoading = false;
    notifyListeners();
  }
}
