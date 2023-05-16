import 'dart:async';

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

  @override
  String get baseUrl => APIEndpoint.baseUrl;

  @override
  String get path {
    return "/graph/v2/recommend/all";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
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
  String get url => baseUrl + path;
}
