part of 'top_rated_tv_series_bloc.dart';

sealed class TopRatedTVSeriesEvent extends Equatable {
  const TopRatedTVSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnGetTopRatedTVSeries extends TopRatedTVSeriesEvent {}
