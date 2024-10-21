part of 'movie_watchlist_bloc.dart';

sealed class MovieWatchlistState extends Equatable {
  const MovieWatchlistState();

  @override
  List<Object> get props => [];
}

final class MovieWatchlistInitial extends MovieWatchlistState {}

final class WatchlistStatusLoading extends MovieWatchlistState {}

final class WatchlistStatusError extends MovieWatchlistState {
  final String message;

  WatchlistStatusError(this.message);

  @override
  List<Object> get props => [message];
}

final class WatchlistStatusLoaded extends MovieWatchlistState {
  final bool isAddedToWatchlist;

  WatchlistStatusLoaded(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

final class SaveWatchlistLoading extends MovieWatchlistState {}

final class SaveWatchlistError extends MovieWatchlistState {
  final String message;

  SaveWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

final class SaveWatchlistSuccess extends MovieWatchlistState {
  final String message;

  SaveWatchlistSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class RemoveWatchlistLoading extends MovieWatchlistState {}

final class RemoveWatchlistError extends MovieWatchlistState {
  final String message;

  RemoveWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

final class RemoveWatchlistSuccess extends MovieWatchlistState {
  final String message;

  RemoveWatchlistSuccess(this.message);

  @override
  List<Object> get props => [message];
}
