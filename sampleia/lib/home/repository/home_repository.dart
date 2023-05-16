import 'package:sampleia/data/model/recommended_response_model.dart';

abstract class HomeRepository {
  /// To Fetch Recommended Charities and groups
  Future<Recommended> fetchRecommended(String userId, int page, int pageSize);
  /// Add methods for each API
}
