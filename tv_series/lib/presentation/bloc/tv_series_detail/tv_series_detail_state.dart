part of 'tv_series_detail_bloc.dart';

sealed class TVSeriesDetailState extends Equatable {
  const TVSeriesDetailState();

  @override
  List<Object> get props => [];
}

class TVSeriesDetailEmpty extends TVSeriesDetailState {}

class TVSeriesDetailLoading extends TVSeriesDetailState {}

class TVSeriesDetailError extends TVSeriesDetailState {
  final String message;

  TVSeriesDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TVSeriesDetailHasData extends TVSeriesDetailState {
  final TVSeriesDetail result;

  TVSeriesDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}
