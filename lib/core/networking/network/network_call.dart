import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:education/core/networking/exceptions/app_exception_extension.dart';
import 'package:education/core/networking/network/result.dart';

import '../../di/dependency_injection.dart';
import '../../helpers/app_strings.dart';
import '../../helpers/main_functions.dart';
import '../exceptions/app_exception.dart';
import '../exceptions/dio_error_handler.dart';
import 'base_consumer.dart';

enum ServerMethods { Get, POST, UPDATE, DELETE, PUT, PATCH }

/// custom network call function ///
Future<Result<T>> networkCall<T>({
  required ServerMethods method,
  required String path,
  Map<String, dynamic>? params,
  dynamic data,
  required T Function(dynamic) fromJson,
  Function(Response?)? successHandler,
  Function(String)? errorHandler,
}) async {
  try {
    final response = await _executeApiCall(method, path, params, data);
    return _handleResponse<T>(response, fromJson, errorHandler, successHandler);
  } catch (e) {
    return _handleApiError(e, errorHandler);
  }
}

/// CALL API WITH METHOD ///
Future<Response<T>> _executeApiCall<T>(ServerMethods method, String path,
    Map<String, dynamic>? params, dynamic data) async {
  switch (method) {
    case ServerMethods.Get:
      return await getIt<BaseConsumer>().get<T>(path, queryParameters: params);
    default:
      throw UnimplementedError('Method $method is not implemented');
  }
}

/// HANDLE API RESPONSE ///
Result<T> _handleResponse<T>(Response? response, T Function(dynamic) fromJson,
    Function(String)? errorHandler, Function(Response?)? successHandler) {
  if (response!.data != null && response.statusCode == 200) {
    return _handleSuccess(response, successHandler, fromJson);
    // CHECK IF THE RESPONSE RETURNS UNAUTHORIZED //
  } else if (response.statusCode == 401) {
    // GlobalContextExt.globalContext!.pushReplacementNamed(Routes.loginRoute);
    return appWarningAlertDialogMessage(title: AppStrings.sessionExpired);
  } else {
    return _handleError(response.statusCode!, errorHandler);
  }
}

/// HANDLE API RESPONSE SUCCESS ///
Result<T> _handleSuccess<T>(response, Function(Response?)? successHandler,
    T Function(dynamic) fromJson) {
  successHandler?.call(response);
  final responseData = fromJson(response.data);
  return Result.success(responseData);
}

/// HANDLE API RESPONSE ERROR ///
Result<T> _handleError<T>(int statusCode, Function(String)? errorHandler) {
  log('API call failed with status code: $statusCode', name: 'Error message');
  errorHandler?.call('Server error: $statusCode');
  return Result.failure('Server error: $statusCode');
}

/// HANDLE API  SUCCESS ///
Result<T> _handleApiError<T>(dynamic e, Function(String)? errorHandler) {
  if (e is NetworkException) {
    log(e.networkErrorMessage(), name: 'Error message');
    return Result.failure(e.networkErrorMessage());
  }
  final exception = DioErrorHandler.handle(e);
  errorHandler?.call('Server error: $e');
  return Result.failure(exception.message);
}
