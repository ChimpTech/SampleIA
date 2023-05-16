import 'package:sampleia/data/model/recommended_response_model.dart';

abstract class HomeRepository {
  Future<Recommended> fetchRecommended(String userId, int page, int pageSize);
}
