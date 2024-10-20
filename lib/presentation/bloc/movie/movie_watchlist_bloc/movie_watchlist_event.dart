part of 'movie_watchlist_bloc.dart';

sealed class MovieWatchlistEvent extends Equatable {
  const MovieWatchlistEvent();

  @override
  List<Object> get props => [];
}

class OnGetWatchlistStatus extends MovieWatchlistEvent {
  final int id;
  final WatchCategory category;
  OnGetWatchlistStatus(this.id, this.category);

  @override
  List<Object> get props => [this.id, this.category];
}

class OnSaveWatchlist extends MovieWatchlistEvent {
  final MovieDetail movie;

  OnSaveWatchlist(this.movie);

  @override
  List<Object> get props => [this.movie];
}

class OnRemoveWatchlist extends MovieWatchlistEvent {
  final int id;

  final WatchCategory category;
  OnRemoveWatchlist(this.id, this.category);

  @override
  List<Object> get props => [this.id, this.category];
}
