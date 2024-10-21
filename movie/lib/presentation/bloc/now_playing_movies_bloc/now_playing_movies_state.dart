part of 'now_playing_movies_bloc.dart';

sealed class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

final class GetNowPlayingMoviesEmpty extends NowPlayingMoviesState {}

final class GetNowPlayingMoviesLoading extends NowPlayingMoviesState {}

class GetNowPlayingMoviesError extends NowPlayingMoviesState {
  final String message;

  const GetNowPlayingMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetNowPlayingMoviesHasData extends NowPlayingMoviesState {
  final List<Movie> result;

  const GetNowPlayingMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
