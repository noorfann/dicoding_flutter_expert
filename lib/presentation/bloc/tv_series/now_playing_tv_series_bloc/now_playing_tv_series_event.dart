part of 'now_playing_tv_series_bloc.dart';

sealed class NowPlayingTVSeriesEvent extends Equatable {
  const NowPlayingTVSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnGetNowPlayingTVSeries extends NowPlayingTVSeriesEvent {}
