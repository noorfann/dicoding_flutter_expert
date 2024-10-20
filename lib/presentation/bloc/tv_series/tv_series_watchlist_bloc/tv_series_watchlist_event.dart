part of 'tv_series_watchlist_bloc.dart';

sealed class TvWatchlistEvent extends Equatable {
  const TvWatchlistEvent();

  @override
  List<Object> get props => [];
}

class OnGetWatchlistStatus extends TvWatchlistEvent {
  final int id;
  final WatchCategory category;
  OnGetWatchlistStatus(this.id, this.category);

  @override
  List<Object> get props => [this.id, this.category];
}

class OnSaveWatchlist extends TvWatchlistEvent {
  final TVSeriesDetail tvSeriesDetail;

  OnSaveWatchlist(this.tvSeriesDetail);

  @override
  List<Object> get props => [this.tvSeriesDetail];
}

class OnRemoveWatchlist extends TvWatchlistEvent {
  final int id;

  final WatchCategory category;
  OnRemoveWatchlist(this.id, this.category);

  @override
  List<Object> get props => [this.id, this.category];
}
