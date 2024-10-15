part of 'watchlist_bloc.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

final class GetWatchlistEmpty extends WatchlistState {}

final class GetWatchlistLoading extends WatchlistState {}

final class GetWatchlistError extends WatchlistState {
  final String errorMessage;
  GetWatchlistError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class GetWatchlistMovieHasData extends WatchlistState {
  final List<Movie> watchlistMovie;

  GetWatchlistMovieHasData(this.watchlistMovie);

  @override
  List<Object> get props => [watchlistMovie];
}

class GetWatchlistTVSeriesHasData extends WatchlistState {
  final List<TVSeries> watchlistTVSeries;

  GetWatchlistTVSeriesHasData(this.watchlistTVSeries);

  @override
  List<Object> get props => [watchlistTVSeries];
}
