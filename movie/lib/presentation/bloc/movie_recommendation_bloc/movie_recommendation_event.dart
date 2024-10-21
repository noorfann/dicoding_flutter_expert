part of 'movie_recommendation_bloc.dart';

sealed class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();

  @override
  List<Object> get props => [];
}

class OnGetMovieRecommendation extends MovieRecommendationEvent {
  final int id;

  OnGetMovieRecommendation(this.id);

  @override
  List<Object> get props => [id];
}
