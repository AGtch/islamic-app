import 'package:dio/dio.dart';

class DioClient {
  Dio buildDioClient(String baseUrl) {
    return Dio(
      BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5)),
    );
  }
}
