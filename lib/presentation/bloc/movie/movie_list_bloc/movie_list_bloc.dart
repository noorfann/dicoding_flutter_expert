import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;
  MovieListBloc(this._getNowPlayingMovies, this._getPopularMovies,
      this._getTopRatedMovies)
      : super(GetNowPlayingMoviesEmpty()) {
    on<MovieListEvent>((event, emit) async {
      if (event is OnGetNowPlayingMovies) {
        _getNowPlayingAct(emit);
      } else if (event is OnGetTopRatedMovies) {
        _getTopRatedAct(emit);
      } else {
        _getPopularAct(emit);
      }
    });
  }

  Future<void> _getNowPlayingAct(Emitter<MovieListState> emit) async {
    emit(GetNowPlayingMoviesLoading());
    final result = await _getNowPlayingMovies.execute();

    result.fold(
      (failure) {
        emit(GetNowPlayingMoviesError(failure.message));
      },
      (data) {
        emit(GetNowPlayingMoviesHasData(data));
      },
    );
  }

  Future<void> _getPopularAct(Emitter<MovieListState> emit) async {
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
  }

  Future<void> _getTopRatedAct(Emitter<MovieListState> emit) async {
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
  }
}
