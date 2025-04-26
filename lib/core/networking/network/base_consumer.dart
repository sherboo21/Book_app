import 'package:dio/dio.dart';

abstract class BaseConsumer {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
