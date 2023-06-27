import 'package:dio/dio.dart';

class Parsed<T> {
  Parsed.fromJson(
    Map<String, dynamic> json,
    this.statusCode,
    this.data,
  ) {
    message = (json['error'] ?? json['detail'] ?? '') as String;
  }

  Parsed.fromPaginationJson(
    Map<String, dynamic> json,
    this.statusCode,
    this.data,
  ) {
    message = (json['error'] ?? json['detail'] ?? '') as String;
  }

  late int statusCode;
  late String message;
  late T data;
}

extension ResponseExtension<T> on Response<dynamic> {
  //ignore:avoid_shadowing_type_parameters
  Parsed<T> parse<T>(T t) {
    return Parsed.fromJson(
      data as Map<String, dynamic>,
      statusCode!,
      t,
    );
  }

  dynamic get responseData => data;

  /// Get iterable data
  dynamic get dataBodyIterable => (data as Map<String, dynamic>)['data'];
  Map<String, dynamic> get bodyAsMap => data as Map<String, dynamic>;
  Map<String, dynamic> get dataBodyAsMap => {
        for (var item in responseData.map((item) => item.toString())) item: data
      };
  Map<String, dynamic> get bodyMap => data as Map<String, dynamic>;
}
