part of 'top_rated_tv_series_bloc.dart';

sealed class TopRatedTVSeriesState extends Equatable {
  const TopRatedTVSeriesState();

  @override
  List<Object> get props => [];
}

/// get top rated movies state
final class GetTopRatedTVSeriesEmpty extends TopRatedTVSeriesState {}

final class GetTopRatedTVSeriesLoading extends TopRatedTVSeriesState {}

class GetTopRatedTVSeriesError extends TopRatedTVSeriesState {
  final String message;

  GetTopRatedTVSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetTopRatedTVSeriesHasData extends TopRatedTVSeriesState {
  final List<TVSeries> result;

  GetTopRatedTVSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}
