import 'package:dio/dio.dart';

class DioClient {
  static const int _defaultTimeoutSeconds = 15;

  Dio buildDioClient(String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: const Duration(seconds: _defaultTimeoutSeconds),
        connectTimeout: const Duration(seconds: _defaultTimeoutSeconds),
        receiveTimeout: const Duration(seconds: _defaultTimeoutSeconds),
      ),
    );
  }
}
