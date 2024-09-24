import 'package:bookia_app/core/Constants/constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }

  static Future<Response> get(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.get(endpoint, options: Options(headers: headers));
  }

  static Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.post(endpoint, data: data, options: Options(headers: headers));
  }
}
