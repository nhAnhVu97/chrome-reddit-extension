import 'package:chrome_ext/core/configs/app_config.dart';
import 'package:chrome_ext/core/data/network/dio/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

class DioProvider {
  Dio? dio;

  void setHeaderToken(String token) {
    dio!.options.headers['Authorization'] = 'Bearer $token';
  }

  void setHeaderVersion(String version) {
    dio!.options.headers['version'] = version;
  }

  void removeHeaderToken() {
    dio!.options.headers['Authorization'] = '';
  }

  Dio getInstance() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = AppConfig.baseUrl;
      dio!.options.connectTimeout = const Duration(seconds: 60);
      dio!.options.contentType = 'application/json';
      dio!.options.headers["Access-Control-Allow-Origin"] = "*";
      dio!.options.headers["Access-Control-Allow-Credentials"] = true;

      dio!.interceptors.add(AuthInterceptor());
    }

    return dio!;
  }
}
