part of 'tv_series_search_bloc.dart';

abstract class TVSeriesSearchState extends Equatable {
  const TVSeriesSearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends TVSeriesSearchState {}

class SearchLoading extends TVSeriesSearchState {}

class SearchError extends TVSeriesSearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData extends TVSeriesSearchState {
  final List<TVSeries> result;

  SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}
