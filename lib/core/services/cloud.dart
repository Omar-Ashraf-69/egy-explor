import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_exlpor/core/services/storage.dart';

class CloudMethods {
  editProfile({
    required String uId,
    required String userName,
    Uint8List? file,
  }) async {
    String response = 'some eerror error';
    try {
      String profilePic = '';
      if (file != null && file.isNotEmpty) {
        profilePic = await StorageMethods().uploadImageToStorage(file, 'users');
      }
      if (userName.isNotEmpty || profilePic.isNotEmpty) {
        Map<String, dynamic> updateData = {
          'userId': uId,
          if (userName.isNotEmpty) 'userName': userName,
          if (profilePic.isNotEmpty) 'profilePic': profilePic,
        };
        await FirebaseFirestore.instance.collection('users').doc(uId).update(updateData);
      }
      response = 'success';
    } catch (e) {
      log(e.toString());
      response = e.toString();
    }
    return response;
  }
}
