part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImagePicked extends ImageState {
  final File image;

  ImagePicked({required this.image});
}

class ImageRecognized extends ImageState {
  final String title;

  ImageRecognized({required this.title});
}

class ImageLocationRecognized extends ImageState {}

class ImageFullyRecognized extends ImageState {
  final String title;
  final String description;
  ImageFullyRecognized({required this.title, required this.description});
}
