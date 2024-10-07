part of 'movie_list_bloc.dart';

sealed class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

/// get now playing movies state
final class GetNowPlayingMoviesEmpty extends MovieListState {}

final class GetNowPlayingMoviesLoading extends MovieListState {}

class GetNowPlayingMoviesError extends MovieListState {
  final String message;

  GetNowPlayingMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetNowPlayingMoviesHasData extends MovieListState {
  final List<Movie> result;

  GetNowPlayingMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

/// get popular movies state
final class GetPopularMoviesEmpty extends MovieListState {}

final class GetPopularMoviesLoading extends MovieListState {}

class GetPopularMoviesError extends MovieListState {
  final String message;

  GetPopularMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetPopularMoviesHasData extends MovieListState {
  final List<Movie> result;

  GetPopularMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

/// get top rated movies state
final class GetTopRatedMoviesEmpty extends MovieListState {}

final class GetTopRatedMoviesLoading extends MovieListState {}

class GetTopRatedMoviesError extends MovieListState {
  final String message;

  GetTopRatedMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetTopRatedMoviesHasData extends MovieListState {
  final List<Movie> result;

  GetTopRatedMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
