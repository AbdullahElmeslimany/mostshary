import 'dart:convert';

import 'package:dio/dio.dart';

abstract class DioHelper {
  static late Dio dio;
  static String url = 'https://travel-logs.onrender.com/info';
  static Map<String, dynamic> headers = {'Content-Type': 'application/json'};
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: url, headers: headers, receiveDataWhenStatusError: true));
  }

  static Future<Response> requestData({required messges}) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    String data = json.encode({"Q": messges});
    return await dio.post(url, data: data);
  }
}
