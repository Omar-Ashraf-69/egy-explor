import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  uploadImageToStorage(Uint8List file, String childName, bool isPost ) async {
    String postId = const Uuid().v1();
    Reference ref = storage.ref().child(childName).child(auth.currentUser!.uid);
    if (isPost) {
      ref.child(postId);
    }
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
