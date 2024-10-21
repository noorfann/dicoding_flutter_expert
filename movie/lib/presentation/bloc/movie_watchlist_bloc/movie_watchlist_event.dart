part of 'movie_watchlist_bloc.dart';

sealed class MovieWatchlistEvent extends Equatable {
  const MovieWatchlistEvent();

  @override
  List<Object> get props => [];
}

class OnGetWatchlistStatus extends MovieWatchlistEvent {
  final int id;
  final WatchCategory category;
  const OnGetWatchlistStatus(this.id, this.category);

  @override
  List<Object> get props => [id, category];
}

class OnSaveWatchlist extends MovieWatchlistEvent {
  final MovieDetail movie;

  const OnSaveWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnRemoveWatchlist extends MovieWatchlistEvent {
  final int id;

  final WatchCategory category;
  const OnRemoveWatchlist(this.id, this.category);

  @override
  List<Object> get props => [id, category];
}
