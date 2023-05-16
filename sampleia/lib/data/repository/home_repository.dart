import 'package:sampleia/data/model/recommended_response_model.dart';
import 'package:sampleia/home/repository/home_repository.dart';

import '../provider/api/recommended_api.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Recommended> fetchRecommended(
      String userId, int page, int pageSize) async {
    final response =
        await RecommendedAPI.fetchRecommended(userId, page, pageSize).request();
    return Recommended.fromJson(response);
  }
}
