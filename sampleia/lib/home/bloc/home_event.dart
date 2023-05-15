part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchRecommended extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
