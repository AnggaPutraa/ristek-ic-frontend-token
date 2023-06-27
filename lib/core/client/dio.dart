import 'dart:convert';

import 'package:dio/dio.dart';

import '../../services/shared_preference_service.dart';

final _options = Options(
  receiveTimeout: const Duration(seconds: 5000),
  sendTimeout: const Duration(seconds: 6000),
);

Future<Response<dynamic>> getIt(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? queryParameters,
}) async {
  final getHeaders = headers ?? SharedPreferencesService.getHeaders();
  final resp = await Dio().get(
    url,
    options: _options.copyWith(
      headers: getHeaders,
    ),
    queryParameters: queryParameters,
  );
  return resp;
}

Future<Response<dynamic>> postIt(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Map<String, dynamic>? queryParameters,
}) async {
  final getHeaders = headers ?? SharedPreferencesService.getHeaders();
  final resp = await Dio().post<Map<String, dynamic>>(
    url,
    data: json.encode(model),
    options: _options.copyWith(
      headers: getHeaders,
    ),
    queryParameters: queryParameters,
  );
  return resp;
}