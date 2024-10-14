import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:equatable/equatable.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies _getPopularMovies;
  PopularMoviesBloc(this._getPopularMovies) : super(GetPopularMoviesEmpty()) {
    on<OnGetPopularMovies>((event, emit) async {
      emit(GetPopularMoviesLoading());
      final result = await _getPopularMovies.execute();
      result.fold(
        (failure) {
          emit(GetPopularMoviesError(failure.message));
        },
        (data) {
          emit(GetPopularMoviesHasData(data));
        },
      );
    });
  }
}
