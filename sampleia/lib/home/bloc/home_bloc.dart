import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sampleia/home/model/recommended_model.dart';

import '../repository/recommended_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RecommendedRepository _recommendedRepository;

  HomeBloc(this._recommendedRepository) : super(RecommendedLoading()) {
    on<FetchRecommended>(_fetchRecommended);
  }

  Future<void> _fetchRecommended(
      FetchRecommended event, Emitter<HomeState> emit) async {
    try {
      emit(RecommendedLoading());
      final data = await _recommendedRepository.getRecommended();
      emit(RecommendedSuccess(data));
    } catch (e) {
      emit(const RecommendedError("Exception in loading recommended"));
    }
  }
}
