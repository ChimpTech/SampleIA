import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sampleia/home/model/recommended_model.dart';

import '../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(RecommendedLoading()) {
    on<FetchRecommended>(_fetchRecommended);
  }

  Future<void> _fetchRecommended(
      FetchRecommended event, Emitter<HomeState> emit) async {
    try {
      emit(RecommendedLoading());
      final recommendedResponse =
          await _homeRepository.fetchRecommended("88440", 1, 10);
      //
      List<RecommendedModel> mWidgetData = [];
      for (final recommended in recommendedResponse.data) {
        mWidgetData.add(RecommendedModel(
            charityId: recommended.attributes.charityId,
            charityName: recommended.attributes.name,
            city: recommended.attributes.city,
            province: recommended.attributes.province));
      }
      //
      emit(RecommendedSuccess(mWidgetData));
    } catch (e) {
      emit(const RecommendedError("Exception in loading recommended"));
    }
  }
}
