import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:sampleia/home/model/recommended_model.dart';

class RecommendedRepository {
  String recommendUrl =
      'https://api.qa.charitableimpact.com/graph/v2/recommend/all?userid=88440&page[number]=1&page[size]=1';

  Future<Recommended> getRecommended() async {
    final uri = Uri.parse(recommendUrl);

    Response response = await get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlJrTkNNVGMxTXpCRVJqVTFNVUUyTlVGQ01rWkRNVUpCTUVRNU5EZEJRVFk1TmtFMU9EWTNNdyJ9.eyJpc3MiOiJodHRwczovL2F1dGgubXkucWEuY2hhcml0YWJsZWltcGFjdC5jb20vIiwic3ViIjoiYXV0aDB8NjM3NjA5MjhkYTJkYmZlZDhlOTkzM2U3IiwiYXVkIjpbImh0dHBzOi8vY2hpbXB0ZWNoLXFhLmF1dGgwLmNvbS9hcGkvdjIvIiwiaHR0cHM6Ly9jaGltcHRlY2gtcWEuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY4NDEzODQ1MiwiZXhwIjoxNjg0MjI0ODUyLCJhenAiOiJ0UUxHbXVrbVF2UmtGNlEyNHZZWWhKWk14UUZobFVzdiIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgcmVhZDpjdXJyZW50X3VzZXIgb2ZmbGluZV9hY2Nlc3MiLCJndHkiOlsicmVmcmVzaF90b2tlbiIsInBhc3N3b3JkIl19.OYp-vxEVPjJY5ET1Djlo9w-_4MQ0YYO5UER2kFZl2kpbumQmd1-NfZYP53ncAW1QRhYCQVAV7iWZa6VFjTwi4dAx2u0z1UeQSEmmbibR2UJCRt5ZHeIwRB7sC0OcsliZdRWc4F2VqAwuxfavj75JAvB3fdou3xf8sJlYBO9X8i6pqPYji20thM3mJz7WnKMCmAB53yzFd_JfVimqzY84giZ1j_Xvfq7zizBSTET2fc39wRcgZB5BbwdJRBbLr5kwad_Fcj23UanDoKfNynnFTgZOZyRr6mUp7sQJj-Ek22ym9f8l7pocdHB1NPm7Q9QfUK2UYpVAUzN59rYXFVwlSQ'
    });

    if (response.statusCode == 200) {
      final result = recommendedFromJson(response.body);
      return result;
    } else {
      throw Exception("Error in getting Recommended");
    }
  }
}
