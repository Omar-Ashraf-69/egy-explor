import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImage({required bool openCamera}) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source:openCamera? ImageSource.camera: ImageSource.gallery);
  if (file != null) {
    return await file.readAsBytes();
  }
  return null;
}
