part of 'movie_watchlist_bloc.dart';

sealed class MovieWatchlistEvent extends Equatable {
  const MovieWatchlistEvent();

  @override
  List<Object> get props => [];
}

class OnGetWatchlistStatus extends MovieWatchlistEvent {
  final int id;
  OnGetWatchlistStatus(this.id);

  @override
  List<Object> get props => [this.id];
}

class OnSaveWatchlist extends MovieWatchlistEvent {
  final MovieDetail movie;

  OnSaveWatchlist(this.movie);

  @override
  List<Object> get props => [this.movie];
}

class OnRemoveWatchlist extends MovieWatchlistEvent {
  final int id;
  OnRemoveWatchlist(this.id);

  @override
  List<Object> get props => [this.id];
}
