part of 'tv_series_detail_bloc.dart';

sealed class TvSeriesDetailEvent extends Equatable {
  const TvSeriesDetailEvent();

  @override
  List<Object> get props => [];
}

class OnGetTVSeriesDetail extends TvSeriesDetailEvent {
  final int id;

  const OnGetTVSeriesDetail(this.id);

  @override
  List<Object> get props => [id];
}
