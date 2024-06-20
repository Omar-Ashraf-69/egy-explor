import 'dart:developer';
import 'dart:io';
import 'package:egy_exlpor/core/utils/api_keys.dart';
import 'package:egy_exlpor/core/utils/api_service.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/destination_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  File? image;
  String? title;
  String? description;
  String? location;
  Future<void> pickImage(bool openCamera, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
        source: openCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(ImagePicked(image: image!));
      Navigator.pushNamed(context, DestinationView.routeName);
      await uploadImage(image!);
    }
  }

  Future<void> uploadImage(File imageFile) async {
    try {
      String fileName = basename(imageFile.path);
      FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      Dio dio = Dio();
      Map<String, dynamic> response = await ApiService(dio).post(
        url: 'http://10.0.2.2:5000/predict',
        body: formData,
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        token: null,
      );

      // Response response = await dio.post(
      //   'http://10.0.2.2:5000/predict', // Your Flask server URL
      //   data: formData,
      //   options: Options(
      //     headers: {
      //       'Content-Type': 'multipart/form-data',
      //     },
      //   ),
      // );
      // if (response.statusCode == 200) {
      //   // Handle the response
      //   log(response.data['predicted_class']);
      // } else {
      //   print('Failed to upload image');
      // }
      log("${response['predicted_class']}");
      title = response['predicted_class'];
      emit(ImageRecognized(title: response['predicted_class']));
      location =
          await chat(message: "Where is the  ${response['predicted_class']}");
      emit(ImageLocationRecognized());
      Map<String, dynamic> res = await ApiService(Dio()).post(
        url: 'https://api.cohere.ai/v1/chat',
        body: {
          "message": response['predicted_class'],
          "connectors": [
            {"id": "web-search"}
          ],
          "max_tokens": 800
        },
        token: ApiKeys.gptkey,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiKeys.gptkey}'
        },
      );
      // Map<String, dynamic> res = await ApiService(dio).post(
      //   url: 'https://api.cohere.ai/v1/chat/',
      //   body: {
      //     "message": response['predicted_class'],
      //     "connectors": [
      //       {"id": "web-search"}
      //     ],
      //     // "max_tokens": 200
      //   },
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   token: 'fQoqm1kACFZf867LLR1MACJb0yth0glrXt0K6Y5W',
      // );
      log(res['text']);
      description = res['text'];
      emit(ImageFullyRecognized(
        title: response['predicted_class'],
        description: res['text'],
      ));
      // Response res = await dio.post(
      //   "https://api.cohere.ai/v1/chat/",
      //   options: Options(
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': 'Bearer fQoqm1kACFZf867LLR1MACJb0yth0glrXt0K6Y5W',
      //     },
      //   ),
      //   data: {
      //     "message": response['predicted_class'],
      //     "connectors": [
      //       {"id": "web-search"}
      //     ],
      //     // "max_tokens": 200
      //   },
      // );
      // if (res.statusCode == 200) {
      //   // Handle the response
      //   log(res.data['text']);
      //   description = res.data['text'];
      //   emit(ImageFullyRecognized(
      //     title: response['predicted_class'],
      //     description: res.data['text'],
      //   ));
      // } else {
      //   print('Failed to get info ');
      // }
    } catch (e) {
      print('Error: $e');
    }
  }
}

Future<String> chat({required String message}) async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  final apiKey = ApiKeys.geminiApiKey;
  // The Gemini 1.5 models are versatile and work with multi-turn conversations (like chat)
  final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 1000));
  // Initialize the chat
  final chat = model.startChat(

      //[
      // Content.text('Hello, I have 2 dogs in my house.'),
      // Content.model(
      //     [TextPart('Great to meet you. What would you like to know?')])
      // ]
      );
  var content = Content.text(message);
  // final response = chat.sendMessageStream(content);
  var response = await chat.sendMessage(content);
  log(response.text!);
  RegExp regex = RegExp(r'\*\*(.*?)\*\*');
  Iterable<Match> matches = regex.allMatches(response.text!);

  for (Match match in matches) {
    String loca = match.group(1)!;
    if (loca.contains('Egypt')) {
      log(loca);
      return loca;
    }
  }
  return '';
}
