part of 'tv_series_watchlist_bloc.dart';

sealed class TvWatchlistState extends Equatable {
  const TvWatchlistState();

  @override
  List<Object> get props => [];
}

final class TvWatchlistInitial extends TvWatchlistState {}

final class WatchlistStatusLoading extends TvWatchlistState {}

final class WatchlistStatusError extends TvWatchlistState {
  final String message;

  WatchlistStatusError(this.message);

  @override
  List<Object> get props => [message];
}

final class WatchlistStatusLoaded extends TvWatchlistState {
  final bool isAddedToWatchlist;

  WatchlistStatusLoaded(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

final class SaveWatchlistLoading extends TvWatchlistState {}

final class SaveWatchlistError extends TvWatchlistState {
  final String message;

  SaveWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

final class SaveWatchlistSuccess extends TvWatchlistState {
  final String message;

  SaveWatchlistSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class RemoveWatchlistLoading extends TvWatchlistState {}

final class RemoveWatchlistError extends TvWatchlistState {
  final String message;

  RemoveWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

final class RemoveWatchlistSuccess extends TvWatchlistState {
  final String message;

  RemoveWatchlistSuccess(this.message);

  @override
  List<Object> get props => [message];
}
