import 'package:dio/dio.dart';

import '../exceptions/dio_error_handler.dart';
import 'base_consumer.dart';

class DioConsumer implements BaseConsumer {
  const DioConsumer(this.dio);

  final Dio dio;

  @override
  Future<Response<T>> get<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _errorHandlerTryCatch(() async {
      return await dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
    });
  }
}

Future<T> _errorHandlerTryCatch<T>(Future<T> Function() function) async {
  try {
    return await function();
  } catch (e) {
    throw DioErrorHandler.handle(e);
  }
}
