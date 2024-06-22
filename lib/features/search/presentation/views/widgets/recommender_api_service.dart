import 'dart:developer';

import 'package:dio/dio.dart';

class RecommenderApiService {
  final Dio dio;

  RecommenderApiService(this.dio);

  Future<Map<String, dynamic>> post(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      final response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        data = data.map((element) {
          if (element['rating'] == null ||
              (element['rating'] is double && element['rating'].isNaN)) {
            element['rating'] = 0.0;
          }
          return element;
        }).toList();
        return {'data': data};
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      log("DioException: $e");
      throw e;
    } catch (e) {
      log("Exception: $e");
      throw e;
    }
  }
}
