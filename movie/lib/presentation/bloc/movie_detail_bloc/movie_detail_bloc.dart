import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:core/domain/usecases/movies/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;
  MovieDetailBloc(
    this._getMovieDetail,
  ) : super(MovieDetailEmpty()) {
    on<OnGetMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      final result = await _getMovieDetail.execute(event.id);
      result.fold(
        (error) {
          emit(MovieDetailError(error.message));
        },
        (data) {
          emit(MovieDetailHasData(data));
        },
      );
    });
  }
}
