part of 'watchlist_bloc.dart';

sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object> get props => [];
}

class OnGetWatchlistMovie extends WatchlistEvent {}

class OnGetWatchlistTVSeries extends WatchlistEvent {}
