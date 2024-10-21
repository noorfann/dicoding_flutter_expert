part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class OnGetMovieDetail extends MovieDetailEvent {
  final int id;

  const OnGetMovieDetail(this.id);

  @override
  List<Object> get props => [id];
}
