import 'package:dio/dio.dart';

class ApiService {
  //https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=subject:cooking
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await _dio.get("$_baseUrl$endpoint");
    return response.data;
  }
}
