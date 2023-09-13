import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio;
  final _baseUrl = 'https://icodesuite.com/v1';
  Api(this.dio);
  Future<dynamic> post(
      {required String endpoint,
      String? token,
      required Map<String, dynamic> body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
      Response response = await dio.post(
        '$_baseUrl$endpoint',
        data: body,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return data;
      } else {
        throw Exception(
            'problem with status code${response.statusCode}with body${response.data}');
      }
    }
  }
}
