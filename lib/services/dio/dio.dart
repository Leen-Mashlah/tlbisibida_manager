import 'package:dio/dio.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Accept': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData(String url,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': testtoken,
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': token,
    };
    return await dio?.post(url, data: body, queryParameters: query);
  }

  static Future<Response?> updateData(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': token,
    };
    return await dio?.put(url, data: body, queryParameters: query);
  }

  static Future<Response?> deleteData(String url,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': token,
    };
    return await dio?.delete(url, queryParameters: query);
  }
}
