import 'dart:async';

import '../../../common/storage/storage_service.dart';
import '../network/api_endpoint.dart';
import '../network/api_provider.dart';
import '../network/api_request_representable.dart';

class RecommendedAPI implements APIRequestRepresentable {
  String? userId;
  int? page;
  int? pageSize;

  RecommendedAPI._({this.userId, this.page, this.pageSize});

  RecommendedAPI.fetchRecommended(String userId, int page, int pageSize)
      : this._(userId: userId, page: page, pageSize: pageSize);

  // final StorageService _storageService = StorageService();

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  String get path {
    return "/graph/v2/recommend/all";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get headers {
    /*String? token;
    _storageService.readSecureData("access_token").then((String result) {
          token = result;
        } as FutureOr Function(String? value));

    if (token != null && token!.isNotEmpty) {
      return {"Authorization": "Bearer $token"};
    } else {
      return {"Authorization": ""};
    }*/
    return "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlJrTkNNVGMxTXpCRVJqVTFNVUUyTlVGQ01rWkRNVUpCTUVRNU5EZEJRVFk1TmtFMU9EWTNNdyJ9.eyJpc3MiOiJodHRwczovL2F1dGgubXkucWEuY2hhcml0YWJsZWltcGFjdC5jb20vIiwic3ViIjoiYXV0aDB8NjM3NjA5MjhkYTJkYmZlZDhlOTkzM2U3IiwiYXVkIjpbImh0dHBzOi8vY2hpbXB0ZWNoLXFhLmF1dGgwLmNvbS9hcGkvdjIvIiwiaHR0cHM6Ly9jaGltcHRlY2gtcWEuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY4NDIzNTc3MSwiZXhwIjoxNjg0MzIyMTcxLCJhenAiOiJ0UUxHbXVrbVF2UmtGNlEyNHZZWWhKWk14UUZobFVzdiIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgcmVhZDpjdXJyZW50X3VzZXIgb2ZmbGluZV9hY2Nlc3MiLCJndHkiOiJwYXNzd29yZCJ9.e3evB5E-sRsrarZdUsAovB42zY2L91F3TMvfx6uwTbzlOGPKJgAMTw7fxv8CzMrkQ-cnrcyAbMgDBqBm4QTQGJgG4RGPLyV6oSlhMb8dPVxBiXmVMloZCjCueaCNSmjkYST4AauJmu3it_hNCCH_0iVfnZvuVIbSKAopkPoOZ7h214jtk8UaCzIcnsI2-4tm1Ke_Jjf02rSXEC2KZ_3T254EOo4TYLgESiVvWZ0fYQuTNypzcn8lGZHTh2R8UKFOv6DD5OVBPA9frzlrLYczzmprsYH8W8Ak3iI80INenxk2WRaz7RsjZQITYaiH1j14YwNse4qJtxlnuNFEDwWT_g";
  }

  Map<String, String> get query {
    return {
      "userid": "$userId",
      "page[number]": "$page",
      "page[size]": "$pageSize"
    };
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
