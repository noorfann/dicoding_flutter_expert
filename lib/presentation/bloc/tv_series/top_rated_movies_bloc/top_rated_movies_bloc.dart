import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  GetTopRatedMovies _getTopRatedMovies;
  TopRatedMoviesBloc(this._getTopRatedMovies)
      : super(GetTopRatedMoviesEmpty()) {
    on<OnGetTopRatedMovies>((event, emit) async {
      emit(GetTopRatedMoviesLoading());
      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) {
          emit(GetTopRatedMoviesError(failure.message));
        },
        (data) {
          emit(GetTopRatedMoviesHasData(data));
        },
      );
    });
  }
}
