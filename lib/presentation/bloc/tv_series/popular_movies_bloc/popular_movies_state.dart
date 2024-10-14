part of 'popular_movies_bloc.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

/// get popular movies state
final class GetPopularMoviesEmpty extends PopularMoviesState {}

final class GetPopularMoviesLoading extends PopularMoviesState {}

class GetPopularMoviesError extends PopularMoviesState {
  final String message;

  GetPopularMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetPopularMoviesHasData extends PopularMoviesState {
  final List<Movie> result;

  GetPopularMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
