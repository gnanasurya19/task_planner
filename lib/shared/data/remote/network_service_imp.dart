import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task_planner/shared/data/remote/app_exception.dart';
import 'package:task_planner/shared/data/remote/network_service.dart';

class NetworkService implements Network {
  @override
  String get baseUrl => "https://fakestoreapi.com/";

  @override
  Future<dynamic> getFromAPI(
    String endUrl, {
    Map<String, dynamic>? queryParams,
  }) async {
    return handleException(http.get(Uri.parse(baseUrl + endUrl)), endUrl);
  }

  @override
  Map<String, dynamic> get header => throw UnimplementedError();

  @override
  Future<dynamic> postToAPI(String endUrl, data) async {
    return handleException(
      http.post(Uri.parse(baseUrl + endUrl), body: data),
      endUrl,
    );
  }

  @override
  void updateHeader(Map<String, dynamic> data) {}

  Future handleException(Future<http.Response> future, String endUrl) async {
    try {
      final response = await future;
      switch (response.statusCode) {
        case 200:
          final responseData = jsonDecode(response.body);
          return responseData;
        case 400:
          throw BadRequestException(
            response.statusCode,
            'Exception at $endUrl',
          );
        case 401:
          throw UnauthorizedException(
            response.statusCode,
            'Exception at $endUrl',
          );
        case 403:
          throw UnauthorizedException(
            response.statusCode,
            'Exception at $endUrl',
          );
        case 404:
          throw NotFoundException(response.statusCode, 'Exception at $endUrl');
        case 500:
          throw InternalServerErrorException(
            response.statusCode,
            'Exception at $endUrl',
          );
        default:
          throw UnknownApiException(1, 'Unknown Exception at $endUrl');
      }
    } catch (e) {
      if (e is SocketException) {
        throw NoInternetException(100, 'No Internet');
      } else {
        throw UnknownApiException(99, 'Unknown Exception ${e.toString()}');
      }
    }
  }
}
