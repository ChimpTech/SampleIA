import 'dart:io';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

import '../../../common/authentication/authentication_manager.dart';
import '../../../common/storage/storage_service.dart';

class HeaderInterceptor implements InterceptorContract {
  late String accessToken;
  final StorageService _storageService = StorageService();
  AuthenticationManager authenticator = AuthenticationManager();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      String? token;
      token = await _storageService.readSecureData("access_token");
      if (token != null && token.isNotEmpty) {
        accessToken = token;
      } else {
        final credentials = await authenticator.getCredentials();
        accessToken = credentials.accessToken;
      }
    } on CredentialsManagerException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    try {
      data.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
