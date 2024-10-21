part of 'popular_tv_series_bloc.dart';

sealed class PopularTVSeriesEvent extends Equatable {
  const PopularTVSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnGetPopularTVSeries extends PopularTVSeriesEvent {}
