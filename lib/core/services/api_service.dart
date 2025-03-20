import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://www.themealdb.com/api/json/v1/1/"),
  );

  Future<Map<String, dynamic>?> getRequest(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response.data;
    } catch (e) {
      print("API Error: $e");
      return null;
    }
  }
}
