part of 'movie_watchlist_bloc.dart';

sealed class MovieWatchlistState extends Equatable {
  const MovieWatchlistState();

  @override
  List<Object> get props => [];
}

final class MovieWatchlistInitial extends MovieWatchlistState {}

class OnSaveWatchlist extends MovieDetailEvent {
  final MovieDetail movie;

  OnSaveWatchlist(this.movie);

  @override
  List<Object> get props => [this.movie];
}

class OnRemoveWatchlist extends MovieDetailEvent {
  final int id;
  OnRemoveWatchlist(this.id);

  @override
  List<Object> get props => [this.id];
}
