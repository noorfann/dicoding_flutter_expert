part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

/// get top rated movies state
final class GetTopRatedMoviesEmpty extends TopRatedMoviesState {}

final class GetTopRatedMoviesLoading extends TopRatedMoviesState {}

class GetTopRatedMoviesError extends TopRatedMoviesState {
  final String message;

  const GetTopRatedMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetTopRatedMoviesHasData extends TopRatedMoviesState {
  final List<Movie> result;

  const GetTopRatedMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
