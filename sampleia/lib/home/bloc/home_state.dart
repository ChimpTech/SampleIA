part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

//Loading State
class RecommendedLoading extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//Success State
class RecommendedSuccess extends HomeState {
  final Recommended recommended;

  const RecommendedSuccess(this.recommended);

  @override
  // TODO: implement props
  List<Object?> get props => [recommended];
}

//Error State
class RecommendedError extends HomeState {
  final String error;

  const RecommendedError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
