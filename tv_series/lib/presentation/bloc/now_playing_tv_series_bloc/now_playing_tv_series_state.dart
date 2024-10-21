part of 'now_playing_tv_series_bloc.dart';

sealed class NowPlayingTVSeriesState extends Equatable {
  const NowPlayingTVSeriesState();

  @override
  List<Object> get props => [];
}

final class GetNowPlayingTVSeriesEmpty extends NowPlayingTVSeriesState {}

final class GetNowPlayingTVSeriesLoading extends NowPlayingTVSeriesState {}

class GetNowPlayingTVSeriesError extends NowPlayingTVSeriesState {
  final String message;

  const GetNowPlayingTVSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetNowPlayingTVSeriesHasData extends NowPlayingTVSeriesState {
  final List<TVSeries> result;

  const GetNowPlayingTVSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}
