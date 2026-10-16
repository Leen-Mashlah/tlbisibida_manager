import 'package:dio/dio.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/services/Cache/cache_helper.dart';

class DioHelper {
  static Dio? dio;

  /// Called when an authenticated request is rejected with HTTP 401,
  /// after the cached token has been cleared.
  static void Function()? onUnauthorized;

  static const String _loginPath = 'login';

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
    dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Read the token on every request so a fresh login is used immediately.
        final token = CacheHelper.token;
        if (token != null &&
            options.path != _loginPath &&
            !options.headers.containsKey('Authorization')) {
          options.headers['Authorization'] = token;
        }
        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401 &&
            error.requestOptions.path != _loginPath) {
          _handleUnauthorized();
        }
        handler.next(error);
      },
    ));
  }

  static void _handleUnauthorized() {
    // Several requests may fail together; only react to the first one.
    if (!CacheHelper.hasToken) return;
    CacheHelper.removeString('token');
    onUnauthorized?.call();
  }

  static Options _options(String? token, {bool ngrok = false}) =>
      Options(headers: {
        if (ngrok) 'ngrok-skip-browser-warning': 'true',
        if (token != null) 'Authorization': token,
      });

  static Future<Response?> getData(String url,
      {Map<String, dynamic>? query, String? token}) async {
    return await dio?.get(url,
        queryParameters: query, options: _options(token));
  }

  static Future<Response?> postData(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? query, String? token}) async {
    return await dio?.post(url,
        data: body,
        queryParameters: query,
        options: _options(token, ngrok: true));
  }

  static Future<Response?> updateData(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? query, String? token}) async {
    return await dio?.put(url,
        data: body,
        queryParameters: query,
        options: _options(token, ngrok: true));
  }

  static Future<Response?> deleteData(String url,
      {Map<String, dynamic>? query, String? token}) async {
    return await dio?.delete(url,
        queryParameters: query, options: _options(token, ngrok: true));
  }
}
