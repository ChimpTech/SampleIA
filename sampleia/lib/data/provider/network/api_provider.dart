import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_http.dart';
import 'api_request_representable.dart';
import 'header_interceptor.dart';
import 'log_interceptor.dart';

class APIProvider {
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable requestData) async {
    try {
      final http = InterceptedHttp.build(
          interceptors: [LogInterceptor(), HeaderInterceptor()]);

      final url = Uri.parse("${requestData.baseUrl}${requestData.path}");

      if (requestData.method == HTTPMethod.get) {
        final response = await http.get(url, params: requestData.query);
        return _returnResponse(response);
      } else if (requestData.method == HTTPMethod.post) {
        final response = await http.post(url,
            params: requestData.query, body: requestData.body);
        return _returnResponse(response);
      }
    } on TimeoutException catch (_) {
      throw TimeOutException("Request Timeout");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final String code;
  final String message;
  final String details;

  AppException(
      {required this.code, required this.message, required this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
