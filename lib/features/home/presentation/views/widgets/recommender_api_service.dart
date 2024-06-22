import 'package:dio/dio.dart';

class RecommenderApiService {
  final Dio dio;

  RecommenderApiService(this.dio);

  Future<List<dynamic>> post(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      final response = await dio.post(url, data: body);
      return response.data as List<dynamic>;
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      print("DioException: ${e.message}");
      return [];
    } catch (e) {
      // Handle other exceptions
      print("Exception: $e");
      return [];
    }
  }
}
