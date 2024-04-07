import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_exlpor/core/services/storage.dart';

class CloudMethods {
  //CollectionReference users = FirebaseFirestore.instance.collection('users');


  editProfile({
    required String uId,
    required String userName,
    String profilePic = '',
    Uint8List? file,
  }) async {
    String response = 'some eerror error';
    try {
      profilePic = file != null
          ? await StorageMethods().uploadImageToStorage(file, 'users')
          : '';
      if (userName.isNotEmpty ) {
        await FirebaseFirestore.instance.collection('users').doc(uId).update({
          'userId': uId,
          'userName': userName,
          'profilePic': profilePic,
        });
      }
      response = 'success';
    } catch (e) {
      log(e.toString());
      response = e.toString();
    }
    return response;
  }
}
