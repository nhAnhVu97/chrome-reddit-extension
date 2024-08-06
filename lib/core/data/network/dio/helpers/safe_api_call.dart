import 'package:chrome_ext/core/data/models/base_error_response.dart';
import 'package:chrome_ext/core/data/network/dio/helpers/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<ApiResult<T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final response = await apiCall;
    return ApiSuccess<T>(data: response);
  } catch (e) {
    var errorMessage = 'Something went wrong!';
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout';
        case DioExceptionType.connectionError:
          errorMessage = 'Connection error';
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive timeout';
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send timeout';
        case DioExceptionType.badResponse:
          errorMessage = '${'Something went wrong!'} ${kDebugMode ? "\nStatus code: ${e.response?.statusCode} \nError: ${e.response?.data}" : ""}';
        case DioExceptionType.cancel:
          errorMessage = 'Request cancelled';
        case DioExceptionType.badCertificate:
          errorMessage = 'Bad certificate';
        case DioExceptionType.unknown:
          errorMessage = 'Something went wrong!';
      }

      BaseErrorResponse? baseError;
      if (e.response?.data != null && e.response!.data is Map<String, dynamic>) {
        baseError = BaseErrorResponse.fromJson(e.response!.data as Map<String, dynamic>);
        errorMessage = baseError.message;
      }

      return ApiError(error: errorMessage, response: e.response, errorResponse: baseError);
    } else {
      errorMessage = e.toString();
      return ApiError(error: errorMessage);
    }
  }
}
