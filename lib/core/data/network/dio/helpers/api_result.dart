import 'package:chrome_ext/core/data/models/base_error_response.dart';
import 'package:dio/dio.dart';

abstract class ApiResult<T> {
  ApiResult({
    this.data,
    this.error,
    this.response,
    this.errorResponse,
  });

  T? data;
  String? error;
  Response<dynamic>? response;
  BaseErrorResponse? errorResponse;
}

class ApiSuccess<T> extends ApiResult<T> {
  ApiSuccess({required super.data});
}

class ApiError<T> extends ApiResult<T> {
  ApiError({
    required String super.error,
    super.response,
    super.errorResponse,
  });
}
